install.packages('jpeg')
install.packages('png')
install.packages('ggplot2')
library('jpeg')
library('png')
library('ggplot2')

rm(sizes)
files <- list.files(path="/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/", pattern="*.jpeg", full.names=TRUE, recursive=FALSE)
sizes <- data.frame("name" = character(), "format"= character(), "size"= double(), "pixels"= double(), "compressionRate"=double())
#sizes <- rbind(sizes, file.size("/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  img <- readJPEG(file.path(file))
  pixels = ncol(img) * nrow(img)
  tmp <- data.frame("name" = basename(file.path(file)),"format"="jpeg", "size" = file.size(file), "pixels"=pixels, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

files <- list.files(path="/home/rob/Documents/CompressionImpactCNN/png/outputImg/", pattern="*.png", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/png/originalImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".png")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  img <- readPNG(file.path(file))
  pixels = ncol(img) * nrow(img)
  tmp <- data.frame("name" = basename(file.path(file)),"format"="png", "size" = file.size(file), "pixels"=pixels, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

files <- list.files(path="/home/rob/Documents/CompressionImpactCNN/bpg/outputImg/", pattern="*.bpg", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/bpg/originalImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".bpg")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  

  tmp <- data.frame("name" = basename(file.path(file)),"format"="bpg", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

meanComp <- aggregate(sizes$compressionRate, list(sizes$format), mean)

meanSize <- aggregate(sizes$size, list(sizes$format), mean)

library(RColorBrewer)
coul <- brewer.pal(5, "Set2") 
barplot(height=meanComp$x, names=meanComp$Group.1, col=coul)

ggplot(meanComp, aes(x=Group.1, y=x)) + 
  geom_bar(stat = "identity", colour="red")



ggplot(meanSize, aes(x=Group.1, y=x)) + 
  geom_bar(stat = "identity")



