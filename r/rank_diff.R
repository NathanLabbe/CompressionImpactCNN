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

#2_40
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in jpegCsv$File_Name){
  if(endsWith(name, "2_40.jpeg")){
    rd <- jpegCsv$Rank_Diff[jpegCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_2_40 <- mean(jpeg$rank_diff)
medjpeg_2_40<- median(jpeg$rank_diff)
sdjpeg_2_40 <- sd(jpeg$rank_diff)

#4_50
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in jpegCsv$File_Name){
  if(endsWith(name, "4_50.jpeg")){
    rd <- jpegCsv$Rank_Diff[jpegCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_4_50 <- mean(jpeg$rank_diff)
medjpeg_4_50<- median(jpeg$rank_diff)
sdjpeg_4_50 <- sd(jpeg$rank_diff)

#8_50
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in jpegCsv$File_Name){
  if(endsWith(name, "8_50.jpeg")){
    rd <- jpegCsv$Rank_Diff[jpegCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_8_50 <- mean(jpeg$rank_diff)
medjpeg_8_50<- median(jpeg$rank_diff)
sdjpeg_8_50 <- sd(jpeg$rank_diff)



jpegRGBCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/jpegRGB.csv")

#TABLEAU jpegRGB 
#1_30
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "1_30.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_1_30 <- mean(jpegRGB$rank_diff)
medjpegRGB_1_30<- median(jpegRGB$rank_diff)
sdjpegRGB_1_30 <- sd(jpegRGB$rank_diff)

#2_10
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "2_10.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_2_10 <- mean(jpegRGB$rank_diff)
medjpegRGB_2_10<- median(jpegRGB$rank_diff)
sdjpegRGB_2_10 <- sd(jpegRGB$rank_diff)

#2_40
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "2_40.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_2_40 <- mean(jpegRGB$rank_diff)
medjpegRGB_2_40<- median(jpegRGB$rank_diff)
sdjpegRGB_2_40 <- sd(jpegRGB$rank_diff)

#4_50
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "4_50.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_4_50 <- mean(jpegRGB$rank_diff)
medjpegRGB_4_50<- median(jpegRGB$rank_diff)
sdjpegRGB_4_50 <- sd(jpegRGB$rank_diff)

#4_20
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "4_20.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_4_20 <- mean(jpegRGB$rank_diff)
medjpegRGB_4_20<- median(jpegRGB$rank_diff)
sdjpegRGB_4_20 <- sd(jpegRGB$rank_diff)

#8_50
jpegRGB <- data.frame("name" = character(), "compression" = double())
for (name in jpegRGBCsv$File_Name){
  if(endsWith(name, "8_50.jpeg")){
    rd <- jpegRGBCsv$Rank_Diff[jpegRGBCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpegRGB <- rbind(jpegRGB, tmp)
  }
}
jpegRGB_8_50 <- mean(jpegRGB$rank_diff)
medjpegRGB_8_50<- median(jpegRGB$rank_diff)
sdjpegRGB_8_50 <- sd(jpegRGB$rank_diff)

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

#2_10
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "2_10.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_2_10 <- mean(png$rank_diff)
medpng_2_10<- median(png$rank_diff)
sdpng_2_10 <- sd(png$rank_diff)

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

#4_20
png <- data.frame("name" = character(), "compression" = double())
for (name in pngCsv$File_Name){
  if(endsWith(name, "4_20.png")){
    rd <- pngCsv$Rank_Diff[pngCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    png <- rbind(png, tmp)
  }
}
png_4_20 <- mean(png$rank_diff)
medpng_4_20 <- median(png$rank_diff)
sdpng_4_20 <- sd(png$rank_diff)

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

j2kCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/j2k.csv")

#TABLEAU J2K 
#1_200_40
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "1_200,40.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_1_200_40 <- mean(j2k$rank_diff)
medj2k_1_200_40<- median(j2k$rank_diff)
sdj2k_1_200_40 <- sd(j2k$rank_diff)

#1_50
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "1_50.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_1_50 <- mean(j2k$rank_diff)
medj2k_1_50<- median(j2k$rank_diff)
sdj2k_1_50 <- sd(j2k$rank_diff)

#2_100_20_10
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "2_100,20,10.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_2_100_20_10 <- mean(j2k$rank_diff)
medj2k_2_100_20_10<- median(j2k$rank_diff)
sdj2k_2_100_20_10 <- sd(j2k$rank_diff)

#2_100_20
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "2_100,20.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_2_100_20 <- mean(j2k$rank_diff)
medj2k_2_100_20<- median(j2k$rank_diff)
sdj2k_2_100_20 <- sd(j2k$rank_diff)

#2_200_40_20
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "2_200,40,20.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_2_200_40_20 <- mean(j2k$rank_diff)
medj2k_2_200_40_20<- median(j2k$rank_diff)
sdj2k_2_200_40_20 <- sd(j2k$rank_diff)

#4_15_10_1
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "4_15,10,1.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_4_15_10_1 <- mean(j2k$rank_diff)
medj2k_4_15_10_1<- median(j2k$rank_diff)
sdj2k_4_15_10_1 <- sd(j2k$rank_diff)

#8_10_5_1
j2k <- data.frame("name" = character(), "compression" = double())
for (name in j2kCsv$File_Name){
  if(endsWith(name, "8_10,5,1.j2k")){
    rd <- j2kCsv$Rank_Diff[j2kCsv$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    j2k <- rbind(j2k, tmp)
  }
}
j2k_8_10_5_1 <- mean(j2k$rank_diff)
medj2k_8_10_5_1<- median(j2k$rank_diff)
sdj2k_8_10_5_1 <- sd(j2k$rank_diff)


