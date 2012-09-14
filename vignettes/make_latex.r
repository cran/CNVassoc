rm(list=ls())

setwd("C:/programs/Dropbox/CNVassoc_project/package/CNVassoc_1.3/CNVassoc/vignettes")                 
treball<-"C:/programs/Dropbox/CNVassoc_project/package/CNVassoc_1.3/CNVassoc/vignettes"
#Stangle(file.path(treball,"CNVassoc_vignette.Rnw"))  # creates chunks     
Sweave(file.path(treball,"CNVassoc_vignette"))
shell(paste("pdflatex \"",file.path(treball,"CNVassoc_vignette"),"\"",sep=""))
shell(paste("bibtex \"",file.path(treball,"CNVassoc_vignette"),"\"",sep=""))
shell(paste("pdflatex \"",file.path(treball,"CNVassoc_vignette"),"\"",sep=""))
shell(paste("pdflatex \"",file.path(treball,"CNVassoc_vignette"),"\"",sep=""))

shell.exec(file.path(treball,"CNVassoc_vignette.pdf"))

file.copy("CNVassoc_vignette.pdf","../inst/doc/CNVassoc_vignette.pdf",overwrite=TRUE)
#file.copy("CNVassoc_vignette.R","../inst/doc/CNVassoc_vignette.R",overwrite=TRUE)

                 
# R CMD build --compact-vignettes CNVassoc




