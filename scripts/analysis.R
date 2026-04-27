.libPaths(c(
  "/home/etw33155/R/x86_64-pc-linux-gnu-library/4.5",
  .libPaths()
))
library(tximport)

R.version.string
.libPaths()

samples <- list.dirs("salmon_out", recursive = FALSE, full.names = TRUE)

files <- file.path(samples, "quant.sf")
files <- files[file.exists(files)]
names(files) <- basename(dirname(files))

txi <- tximport(files, type = "salmon", txOut = TRUE)

head(txi$counts)