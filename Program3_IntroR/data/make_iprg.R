iprg <- read.csv("iPRG_example_runsummary_0.csv")
iprg$TechReplicate <-
    factor(sub("\\.raw", "", sub(".+sample.+_", "", sub("-", "_", iprg$Run))))
save(iprg, file = "iprg.rda")
write.csv(iprg, file = "iPRG_example_runsummary.csv", row.names = FALSE)


set.seed(123)
i <- c(1, 3, 5, sample(nrow(iprg), 1e3))
iprgna <- iprg
iprgna[i, "Intensity"] <- NA
iprgna[, "Log2Intensity"] <- NULL
save(iprgna, file = "iprgna.rda")
