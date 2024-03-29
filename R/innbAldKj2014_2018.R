#' Norske befolkningsdata om demografi og tilhørighet i spesialisthelsesystemet
#'
#' Et datasett med norske befolkningsdata fra og med 2014 til og med 2018 om
#' demografi (alder, kjønn, (bydel), kommune, fylke) og tilhørighet i
#' spesialisthelsetjenesten (helseforetak, regionalt helseforetak).
#' Datasettet angir også antall innbyggere i de ulike demografiske gruppene.
#'
#' @format Dataramme med 505 620 observasjoner og 14 variabler
#' \describe{
#'   \item{Aar}{2014:2018}
#'   \item{ErMann}{0-kvinne, 1-mann}
#'   \item{Alder}{alder i hele år}
#'   \item{KomNr}{Kommunenummer}
#'   \item{KomNrTxt}{Kommunenavn}
#'   \item{Fylke}{Fylke}
#'   \item{FylkeNr}{Fylke, numerisk kode}
#'   \item{BoHF}{Navn på helseforetaket (HF) personen er bosatt i}
#'   \item{BoHFnr}{Numerisk kode på HF'et personen er bosatt i}
#'   \item{BoRHF}{Navn på det regionale helseforetaket (RHF) personen er bosatt i}
#'   \item{BoRHFnr}{Numerisk kode på RHF'et personen er bosatt i}
#'   \item{Bydel}{Navn på bydel personen er bosatt i. Bare aktuelt hvis personen er bosatt i Oslo, Trondheim eller Bergen}
#'   \item{BydelNr}{Numerisk kode på bydel personen er bosatt i. Bare aktuelt hvis personen er bosatt i Oslo, Trondheim eller Bergen}
#'   \item{Innbyggere}{Antall innbyggere}
#' }
#' @source \url{}
"innbAldKj2014_18"
