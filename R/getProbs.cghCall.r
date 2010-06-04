getProbs.cghCall <-
function (x)
{
    if (!inherits(x, "cghCall"))
        stop("object must be of class 'cghCall'")
    Clone <- featureNames(x)
    Chromo <- chromosomes(x)
    BPstart <- bpstart(x)
    BPend <- bpend(x)
    Calls <- calls(x)
    Probloss <- probloss(x)
    Probnorm <- probnorm(x)
    Probgain <- probgain(x)
    colnam <- c(colnames(Probloss), colnames(Probnorm), colnames(Probgain))
    if (is.null(probamp(x))) {
        allprob <- c()
        ncl <- ncol(Probnorm)
        for (i in 1:ncl) {
            Probsall <- cbind(Probloss[, i], Probnorm[, i], Probgain[,
                i])
            colnames(Probsall) <- c(colnam[i], colnam[ncl + i],
                colnam[2 * ncl + i])
            allprob <- cbind(allprob, Probsall)
        }
    }
    else {
        Probamp <- probamp(x)
        colnam <- c(colnam, colnames(Probamp))
        allprob <- c()
        ncl <- ncol(Probnorm)
        for (i in 1:ncl) {
            Probsall <- cbind(Probloss[, i], Probnorm[, i], Probgain[,
                i], Probamp[, i])
            colnames(Probsall) <- c(colnam[i], colnam[ncl + i],
                colnam[2 * ncl + i], colnam[3 * ncl + i])
            allprob <- cbind(allprob, Probsall)
        }
    }
    allprob2 <- round(allprob, 3)
    probs <- data.frame(Clone, Chromo, BPstart, BPend, allprob2)
    probs
}

