# Takes a list of mouse genes, and gives you the human gene equivalent
library(biomaRt)
human <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
mouse <- useMart("ensembl", dataset = "mmusculus_gene_ensembl")

genes.converted <- getLDS(
                attributes = c("mgi_symbol"), 
                filters = "mgi_symbol",
                # Put the genes of interest here
                values = c("gene1", "gene2"), 
                mart = mouse, 
                attributesL = c("hgnc_symbol"), 
                martL = human, 
                uniqueRows=T)
genes.converted <- unique(genes.converted[, 2])
