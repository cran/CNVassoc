pkgname <- "CNVassoc"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('CNVassoc')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("CNVassoc")
### * CNVassoc

flush(stderr()); flush(stdout())

### Name: CNVassoc
### Title: Association analysis between a CNV and phenotype
### Aliases: CNVassoc anova.CNVassoc logLik.CNVassoc print.CNVassoc
###   summary.CNVassoc print.anova.CNVassoc print.summary.CNVassoc
### Keywords: misc

### ** Examples

data(dataMLPA)
CNV  <-  cnv(x  =  dataMLPA$Gene2,  threshold.0  =  0.01,  mix.method  =  "mixdist")
modmul  <-  CNVassoc(casco  ~  CNV,  data  =  dataMLPA,  model  =  "mul")
modmul
summary(modmul)
anova(modmul,update(modmul,model="add"))
logLik(modmul)



cleanEx()
nameEx("CNVtest")
### * CNVtest

flush(stderr()); flush(stdout())

### Name: CNVtest
### Title: Testing association between a CNV and phenotype
### Aliases: CNVtest print.CNVtest
### Keywords: misc

### ** Examples

data(dataMLPA)
CNV<- cnv(x = dataMLPA$Gene2, threshold.0 = 0.01, mix.method = "mixdist")
mod<-CNVassoc(formula = casco ~ CNV, data = dataMLPA, model = "mul")
CNVtest(mod, type = "LRT")
CNVtest(mod, type = "Wald")



cleanEx()
nameEx("cnv")
### * cnv

flush(stderr()); flush(stdout())

### Name: cnv
### Title: CNV object
### Aliases: cnv cnvBatches cnvDefault is.cnv plot.cnv print.cnv
### Keywords: misc

### ** Examples

data(dataMLPA)
CNV  <-  cnv(x  =  dataMLPA$Gene2,  threshold.0  =  0.01,  mix.method  =  "mixdist")
CNV
plot(CNV)



cleanEx()
nameEx("getQualityScore")
### * getQualityScore

flush(stderr()); flush(stdout())

### Name: getQualityScore
### Title: Computes a quality score for a CNV fit
### Aliases: getQualityScore getQualityScore.default getQualityScore.cnv
###   print.QualityScore
### Keywords: misc

### ** Examples

data(dataMLPA)
CNV<-cnv(x = dataMLPA$Gene2, threshold.0 = 0.01, mix.method = "mixdist")
getQualityScore(CNV,type="class")
getQualityScore(CNV,type="CNVtools")
getQualityScore(CNV,type="CANARY")



cleanEx()
nameEx("plotSignal")
### * plotSignal

flush(stderr()); flush(stdout())

### Name: plotSignal
### Title: plots the intensities of a CNV univariate signal data
### Aliases: plotSignal
### Keywords: utilities

### ** Examples

data(dataMLPA)
plotSignal(dataMLPA$Gene2)



cleanEx()
nameEx("simCNVdataBinary")
### * simCNVdataBinary

flush(stderr()); flush(stdout())

### Name: simCNVdataBinary
### Title: Simulation of CNV and discrete traits
### Aliases: simCNVdataBinary
### Keywords: utilities

### ** Examples

maf<-0.3
set.seed(123)
simData<-simCNVdataBinary(n=1000, mu.surrog=c(0,0.5,1), sd.surrog=rep(0.15,3), 
         w=c((1-maf)^2,2*maf*(1-maf),maf^2), p0=0.1, or=c(1.3,1.3^2), cnv.random = FALSE)
CNV<-cnv(simData$surrog,mix.method="EMmixt")
getQualityScore(CNV,type="CNVtools")
mod<-CNVassoc(resp~CNV,data=simData,family="binomial")
CNVtest(mod)
summary(mod)



cleanEx()
nameEx("simCNVdataCaseCon")
### * simCNVdataCaseCon

flush(stderr()); flush(stdout())

### Name: simCNVdataCaseCon
### Title: Simulation of CNV in a case-control study design
### Aliases: simCNVdataCaseCon
### Keywords: utilities

### ** Examples

maf<-0.3
set.seed(123)
simData<-simCNVdataCaseCon(n0=1000, n1=1000, mu.surrog0=c(0,0.5,1), sd.surrog0=rep(0.15,3), 
         mu.surrog1=c(0,0.5,1), sd.surrog1=rep(0.15,3), 
         w0=c((1-maf)^2,2*maf*(1-maf), maf^2), or=c(1.3,1.3^2),  
         random = FALSE)
CNV<-cnv(simData$surrog,mix.method="EMmixt")
getQualityScore(CNV,type="CNVtools")
mod<-CNVassoc(resp~CNV,data=simData,family="binomial")
CNVtest(mod)
summary(mod)



cleanEx()
nameEx("simCNVdataNorm")
### * simCNVdataNorm

flush(stderr()); flush(stdout())

### Name: simCNVdataNorm
### Title: Simulation of CNV and quantitative traits
### Aliases: simCNVdataNorm
### Keywords: misc

### ** Examples

set.seed(123)
maf<-0.3
effect<-3
simData<-simCNVdataNorm(n=1000, mu.surrog=c(0,0.5,1), sd.surrog=rep(0.15,3), 
         w=c((1-maf)^2,2*maf*(1-maf), maf^2), mu.y=100+c(0,effect,2*effect), sd.y=rep(20,3), cnv.random = FALSE)
CNV<-cnv(simData$surrog,mix.method="EMmixt")
getQualityScore(CNV,type="CNVtools")
mod<-CNVassoc(resp~CNV,data=simData,family="gaussian",emsteps=10)
CNVtest(mod)
summary(mod)



cleanEx()
nameEx("simCNVdataPois")
### * simCNVdataPois

flush(stderr()); flush(stdout())

### Name: simCNVdataPois
### Title: Simulate Poisson data
### Aliases: simCNVdataPois
### Keywords: utilities

### ** Examples

set.seed(123)
rr<-1.5
maf<-0.3
simData<-simCNVdataPois(n=1000, mu.surrog=c(0,0.5,1), sd.surrog=rep(0.15,3), 
         w=c((1-maf)^2,2*maf*(1-maf), maf^2), lambda=3*c(1,rr,rr^2),  cnv.random = FALSE)
CNV<-cnv(simData$surrog,mix.method="EMmixt")
getQualityScore(CNV,type="CNVtools")
mod<-CNVassoc(resp~CNV,data=simData,family="poisson",emsteps=10)
CNVtest(mod)
summary(mod)



cleanEx()
nameEx("simCNVdataWeibull")
### * simCNVdataWeibull

flush(stderr()); flush(stdout())

### Name: simCNVdataWeibull
### Title: Simulate of CNV and a right censored Weibull distributed trait
### Aliases: simCNVdataWeibull
### Keywords: utilities

### ** Examples

library(survival)  
maf<-0.3
hr<-1.5
set.seed(123)
simData<-simCNVdataWeibull(n=4000, mu.surrog=c(0,0.5,1), sd.surrog=rep(0.15,3), 
         w=c((1-maf)^2,2*maf*(1-maf), maf^2), lambda=0.05*c(1,hr,hr^2), shape=rep(1,3), time.cens=1.5, cnv.random = FALSE)
CNV<-cnv(simData$surrog,mix.method="EMmixt")
getQualityScore(CNV,type="CNVtools")  
mod<-CNVassoc(Surv(resp, cens)~CNV,data=simData,family="weibull")
CNVtest(mod)
summary(mod)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
