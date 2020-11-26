jpegCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/jpeg.csv")

#TABLEAU JPEG 
#1_30
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in jpegCsv$File_Name){
  if(endsWith(name, "1_30.jpeg")){
    rd <- jpegCsv$Rank_Diff[jpegCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_1_30 <- mean(jpeg$rank_diff)
medjpeg_1_30<- median(jpeg$rank_diff)
sdjpeg_1_30 <- sd(jpeg$rank_diff)

pngCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/png.csv")

#TABLEAU PNG
#1_30
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "1_30.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_1_30 <- mean(png$rank_diff)
medpng_1_30<- median(png$rank_diff)
sdpng_1_30 <- sd(png$rank_diff)

#2_40
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "2_40.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_2_40 <- mean(png$rank_diff)
medpng_2_40<- median(png$rank_diff)
sdpng_2_40 <- sd(png$rank_diff)

#4_50
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "4_50.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_4_50 <- mean(png$rank_diff)
medpng_4_50<- median(png$rank_diff)
sdpng_4_50 <- sd(png$rank_diff)

#8_50
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "8_50.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_8_50 <- mean(png$rank_diff)
medpng_8_50<- median(png$rank_diff)
sdpng_8_50 <- sd(png$rank_diff)


