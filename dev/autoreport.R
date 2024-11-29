
######################
# autoreport-innslag #
######################

# Les fil fra Sigurd
filename <- "c://Users/ast046/Downloads/autoreport.yml/autoReport.yml"
con <- file(filename, "r")
tmp_yml <- yaml::read_yaml(con)
close(con)

# Dagens løsning
#################

tmp_json <- jsonlite::serializeJSON(tmp_yml)

query <- paste0("UPDATE autoreport SET j = '", tmp_json, "';")

con <- rapbase::rapOpenDbConnection("autoreport")$con
DBI::dbExecute(con, query)
rapbase::rapCloseDbConnection(con)


# Som tabell i db
##################


myfunc <- function(x) {
  x |>
    purrr::modify_at("runDayOfYear", toString)
}
mydata <- tmp_yml |> purrr::map(myfunc)

dataframe <- setNames(data.frame(matrix(ncol = 15, nrow = 0)), c("id", names(mydata[[1]]))) |>
  dplyr::mutate(across(everything(), as.character))

k <- 0
for (oppf in mydata) {
  k <- k + 1
  for (emails in oppf$email) {
    dataframe <- dataframe |> tibble::add_row(
      id = names(mydata)[k],
      synopsis = oppf$synopsis,
      package = oppf$package,
      fun = oppf$fun,
      params = paste0("{", paste0("\"", names(oppf$params), "\": \"", oppf$params, "\"",collapse=", " ), "}"),
      owner = oppf$owner,
      email = emails,
      organization = oppf$organization,
      terminateDate = oppf$terminateDate,
      interval = oppf$interval,
      intervalName = oppf$intervalName,
      type = oppf$type,
      ownerName = oppf$ownerName,
      startDate = oppf$startDate,
      runDayOfYear = oppf$runDayOfYear
    )
  }
}

Sys.setenv(db_autoreport2 = "db_autoreport2")
con <- rapbase::rapOpenDbConnection("db_autoreport2")$con
#DBI::dbExecute(con, query)

DBI::dbRemoveTable(con, "autoreport")
DBI::dbCreateTable(con, "autoreport", dataframe)
DBI::dbAppendTable(con, "autoreport", dataframe, row.names = NULL)

rapbase::rapCloseDbConnection(con)

##################
