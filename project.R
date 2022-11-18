print("please just work")
fileConn<-file("report.txt")
writeLines(c("Report to be made later"), fileConn)
close(fileConn)
