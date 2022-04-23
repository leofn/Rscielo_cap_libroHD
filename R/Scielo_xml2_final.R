# create a empty data frame
df <- data.frame()

# RETRIEVE XML FILES
xml_files <- list.files(file.path("D:\\Downloads\\CIÊNCIAS_HUMANAS_2021-06-21\\CIÊNCIAS_HUMANAS_2021-06-21\\XML", recursive = TRUE), 
                        pattern = "\\.xml")

dir.files  <- list.dirs(path="D:\\Downloads\\CIÊNCIAS_HUMANAS_2021-06-21\\CIÊNCIAS_HUMANAS_2021-06-21\\XML", recursive = F) 
dat.files <- lapply(dir.files, list.files)
# final list of all XML files
files <- unlist(dat.files)
files[1]



# reading XML

doc <- xml2::read_xml("D:\\Downloads\\CIÊNCIAS_HUMANAS_2021-06-21\\CIÊNCIAS_HUMANAS_2021-06-21\\XML\\Ágora_Estudos_em_Teoria_Psicanalítica\\3gCcSffKSCYftkPnFxtFN4C.xml")

# scielo_v2
scielo_v2 <- xml2::xml_find_all(doc, 
                                "//article-id[contains(@specific-use,'scielo-v2')]")
scielo_v2 <- xml2::xml_text(scielo_v2) 
# scielo_v3
scielo_v3 <- xml2::xml_find_all(doc, 
                                "//article-id[contains(@specific-use, 'scielo-v3')]")
scielo_v3 <- xml2::xml_text(scielo_v3) 
# doi
doi <- xml2::xml_find_all(doc, "//article-id[contains(@pub-id-type,'doi')]")
doi <- xml2::xml_text(doi)
  ## journal-title
journal_title <- xml2::xml_find_all(doc, "//journal-title")
journal_title <- xml2::xml_text(journal_title)
## article_title
article_title <- xml2::xml_find_all(doc, "//article-title")
article_title <- xml2::xml_text(article_title)
# abstract
abstract <- xml2::xml_find_all(doc, "//abstract/p")
abstract <- xml2::xml_text(abstract)
## pub-date
pub_date <-getNodeSet(doc,"//pub-date/year")
pub_date <-xmlSApply(pub_date,xmlValue)
#  keywords in pt-br
kwd <- xml2::xml_find_all(doc, "//kwd-group[contains(@xml:lang,'pt')]/kwd")
kwd <- xml2::xml_text(kwd)

