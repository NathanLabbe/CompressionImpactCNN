install.packages('jpeg')
install.packages('png')
install.packages('ggplot2')
library('jpeg')
library('png')
library('ggplot2')

rm(sizes)

#AJOUT DE JPEG
files <- list.files(path="./jpeg/outputImg/", pattern="*.jpeg", full.names=TRUE, recursive=FALSE)
sizes <- data.frame("name" = character(), "format"= character(), "size"= double(), "pixels"= double(), "compressionRate"=double())
#sizes <- rbind(sizes, file.size("./jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="./inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  #img <- readJPEG(file.path(file))
  #pixels = ncol(img) * nrow(img)
  tmp <- data.frame("name" = basename(file.path(file)),"format"="jpeg", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}


#AJOUT DE PNG
files <- list.files(path="./png/outputImg/", pattern="*.png", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("./jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="./inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  print(pathInput)
  #print(file)
  compressionRate = file.size(pathInput)/file.size(file)
  
  #img <- readPNG(file.path(file))
  #pixels = ncol(img) * nrow(img)
  tmp <- data.frame("name" = basename(file.path(file)),"format"="png", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}



#AJOUT DE BPG
files <- list.files(path="./bpg/outputImg/", pattern="*.bpg", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("./jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="./inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  

  tmp <- data.frame("name" = basename(file.path(file)),"format"="bpg", "size" = file.size(file), "pixels"=0, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}


#AJOUT DE J2K
files <- list.files(path="./jpeg2000/outputImg/", pattern="*.j2k", full.names=TRUE, recursive=FALSE)
for (file in files){
  
  pathInput="./inputImg/"
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



#TABLEAU PNG
#1_30
png <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "1_30.png")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    png <- rbind(png, tmp)
  }
}
png_1_30 <- mean(png$compression)
medpng_1_30 <- median(png$compression)
sdpng_1_30 <- sd(png$compression)
#2_40
png <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "2_40.png")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    png <- rbind(png, tmp)
  }
}
png_2_40 <- mean(png$compression)
medpng_2_40 <- median(png$compression)
sdpng_2_40 <- sd(png$compression)
#4_50
png <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "4_50.png")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    png <- rbind(png, tmp)
  }
}
png_4_50 <- mean(png$compression)
medpng_4_50 <- median(png$compression)
sdpng_4_50 <- sd(png$compression)
#8_50
png <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "8_50.png")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    png <- rbind(png, tmp)
  }
}
png_8_50 <- mean(png$compression)
medpng_8_50 <- median(png$compression)
sdpng_8_50 <- sd(png$compression)



#TABLEAU JPEG 
#1_30
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "1_30.jpeg")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_1_30 <- mean(jpeg$compression)
medjpeg_1_30 <- median(jpeg$compression)
sd_1_30 <- sd(jpeg$compression)
#2_40
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
#4_50
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "4_50.jpeg")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_4_50 <- mean(jpeg$compression)
medjpeg_4_50 <- median(jpeg$compression)
sd_4_50 <- sd(jpeg$compression)
#8_50
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "8_50.jpeg")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_8_50 <- mean(jpeg$compression)
medjpeg_8_50 <- median(jpeg$compression)
sd_8_50 <- sd(jpeg$compression)


#TABLEAU J2K
#1_200,40
j2k <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "1_200,40.j2k")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_1_200_40 <- mean(j2k$compression)
medj2k_1_200_40<- median(j2k$compression)
sdj2k_1_200_40 <- sd(j2k$compression)
#1_50
j2k <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "1_50.j2k")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_1_50 <- mean(j2k$compression)
medj2k_1_50<- median(j2k$compression)
sdj2k_1_50 <- sd(j2k$compression)
#2_100,20,10
j2k <- data.frame("name" = character(), "compression" = double())
for (name in sizes$name){
  if(endsWith(name, "2_100,20,10.j2k")){
    cr <- sizes$compressionRate[sizes$name == name]
    tmp <- data.frame("name" = name, "compression" = cr)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_2_100_20_10 <- mean(j2k$compression)
medj2k_2_100_20_10<- median(j2k$compression)
sdj2k_2_100_20_10 <- sd(j2k$compression)




