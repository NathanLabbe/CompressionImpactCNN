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
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  

  tmp <- data.frame("name" = basename(file.path(file)),"format"="bpg", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

files <- list.files(path="/home/rob/Documents/CompressionImpactCNN/jpeg2000/outputImg/", pattern="*.j2k", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  
  tmp <- data.frame("name" = basename(file.path(file)),"format"="j2k", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

meanComp <- aggregate(sizes$compressionRate, list(sizes$format), mean)

meanSize <- aggregate(sizes$size, list(sizes$format), mean)

library(RColorBrewer)
coul <- brewer.pal(5, "Set2") 
barplot(height=meanComp$x, names=meanComp$Group.1, col=coul)

coul <- brewer.pal(5, "Set1") 
barplot(height=meanSize$x, names=meanSize$Group.1, col=coul)

ggplot(meanComp, aes(x=Group.1, y=x)) + 
  geom_bar(stat = "identity", colour="red")



ggplot(meanSize, aes(x=Group.1, y=x)) + 
  geom_bar(stat = "identity")


bpg <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "4_40.bpg")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    bpg <- rbind(bpg, tmp)
  }
}
bpg_4_40 <- mean(bpg$compression)

jpeg <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "2_40.jpeg")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_2_40 <- mean(jpeg$compression)
medjpeg_2_40 <- median(jpeg$compression)
sd_2_40 <- sd(jpeg$compression)

j2k <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "2_200,40,20.j2k")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_2_200_40_20 <- mean(j2k$compression)


