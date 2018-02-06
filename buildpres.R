library(rmarkdown)
slides=sort(list.files(pattern = "*.Rmd",full.names=TRUE),
            decreasing=TRUE)
for (f in slides) render(f,output_dir = "docs")
