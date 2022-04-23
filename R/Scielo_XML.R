library(XML)



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
for(i in files){
  
  doc = xmlTreeParse(file = "D:\\Downloads\\CIÊNCIAS_HUMANAS_2021-06-21\\CIÊNCIAS_HUMANAS_2021-06-21\\XML\\Ágora_Estudos_em_Teoria_Psicanalítica\\3gCcSffKSCYftkPnFxtFN4C.xml", useInternalNodes = TRUE, encoding =  "UTF-8")
  doc <- XML::xmlParse(doc, useInternalNodes = TRUE)  
  
doc = xmlTreeParse()
doc <- XML::xmlParse(file, useInternalNodes = TRUE)
#### elementos do artigo
## ID + DOI
id_doi <- getNodeSet(doc,"//article-meta/article-id")
id_doi <- xmlSApply(id_doi, xmlValue)
id <- id_doi[1]
doi <- id_doi[2]
## ID Revista
id <- getNodeSet(doc, "//journal-meta/journal-id")
id <- xmlSApply(id, xmlValue)
## nome da revista
revista <- getNodeSet(doc, "//journal-title")
revista <- xmlSApply(revista, xmlValue)
## titulo do artigo
titulo <- getNodeSet(doc, "//article-title")
titulo <- xmlSApply(titulo, xmlValue)
#resumo
resumo <- getNodeSet(doc, "//abstract/p")
resumo <- xmlSApply(resumo, xmlValue)
## pub-date
pub_date <-getNodeSet(doc,"//pub-date/year")
pub_date <-xmlSApply(pub_date,xmlValue)
## Palavras-chave em pt-br
kwdpt<- xml2::xml_find_all(doc, "//kwd-group xml:lang='pt'")
  
  getNodeSet(doc, "//kwd-group/")
kwdpt<- xmlSApply(kwdpt, xmlValue)
#texto
texto <- getNodeSet(doc, "//body//sec//p")
texto <- xmlSApply(texto, xmlValue)
texto <- paste(texto, collapse = ' ')
df <- data.frame(rbind(cbind(id, doi, revista, titulo, resumo, pub_date[1], texto)))






