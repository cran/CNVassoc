multiCNVassoc<-function(x,formula,...)
 {
   ans<-lapply(x, function(i) try(assocCNV.i(i,formula,...),TRUE))
   ans
 }

