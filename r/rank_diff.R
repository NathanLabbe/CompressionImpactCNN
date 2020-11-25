test <- read.csv("/home/rob/Documents/CompressionImpactCNN/jpeg.csv")

#TABLEAU JPEG 
#1_30
jpeg <- data.frame("name" = character(), "compression" = double())
for (name in test$File_Name){
  if(endsWith(name, "1_30.jpeg")){
    rd <- test$Rank_Diff[test$File_Name == name]
    tmp <- data.frame("name" = name, "rank_diff" = rd)
    jpeg <- rbind(jpeg, tmp)
  }
}
jpeg_1_30 <- mean(jpeg$rank_diff)
medjpeg_1_30<- median(jpeg$rank_diff)
sdjpeg_1_30 <- sd(jpeg$rank_diff)