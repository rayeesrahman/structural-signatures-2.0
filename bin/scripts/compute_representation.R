#!/usr/bin/Rscript  
args <- commandArgs(TRUE)
counted.frequencies = read.table(args[1], sep = ",", header = F, ) 
background.frequencies = read.table(args[2], sep = ",", header =F )
number.proteins = as.numeric(args[3] )
count.proteome = 20230 ##number of proteins in reviewed proteome 
for ( i in 1:nrow(counted.frequencies)){
    ipr = as.character(counted.frequencies[i,1])
    cnt = as.numeric(counted.frequencies[i,2])
    wo = as.numeric(number.proteins - cnt )
    bg.cnt = as.numeric(background.frequencies[which(background.frequencies$V1 == ipr ) , 2] )
    wo.bg.cnt = count.proteome - bg.cnt
    mat = as.data.frame(cbind(c(cnt,wo),c(bg.cnt,wo.bg.cnt)) )
    mat.ft = fisher.test(mat , alternative = "greater" )
    pvalue = mat.ft$p.value
    pvalue.corrected = pvalue * nrow(counted.frequencies)
    freq = cnt/number.proteins 
    bg.freq = bg.cnt/count.proteome 
    fc = log10(freq/bg.freq)
    print(paste(ipr, cnt , bg.cnt , number.proteins , count.proteome ,pvalue, pvalue.corrected, fc  , sep = " ")) 
}