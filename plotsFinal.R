jpegCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/jpeg.csv")

rm(sizes)

#AJOUT DE JPEG
files <- list.files(path="./jpeg/outputImg/", pattern="*.jpeg", full.names=TRUE, recursive=FALSE)
sizes <- data.frame("name" = character(), "format"= character(), "compressionRate"=double(), "SSIM"=double(), "PSNR"=double(), "rank"=double(), "rank_diff"=double())
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
  tmp <- data.frame("name" = basename(file.path(file)),"format"="jpeg" , "compressionRate"= compressionRate, "SSIM" = jpegCsv$SSIM[jpegCsv$File_Name == basename(file.path(file))], "PSNR" = jpegCsv$PSNR[jpegCsv$File_Name == basename(file.path(file))], "rank"= jpegCsv$rank[jpegCsv$File_Name == basename(file.path(file))], "rank_diff"= jpegCsv$Rank_Diff[jpegCsv$File_Name == basename(file.path(file))])
  
  sizes <- rbind(sizes, tmp)
}

pngCsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/png.csv")
#AJOUT DE PNG
files <- list.files(path="./png/outputImg/", pattern="*.png", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("./jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="./inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  
  pathInput <- gsub(" ", "", pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  tmp <- data.frame("name" = basename(file.path(file)),"format"="png" , "compressionRate"= compressionRate, "SSIM" = pngCsv$SSIM[pngCsv$File_Name == basename(file.path(file))], "PSNR" = pngCsv$PSNR[pngCsv$File_Name == basename(file.path(file))], "rank"= pngCsv$rank[pngCsv$File_Name == basename(file.path(file))], "rank_diff"= pngCsv$Rank_Diff[pngCsv$File_Name == basename(file.path(file))])
  
  sizes <- rbind(sizes, tmp)
}

j2kcsv <- read.csv("/home/rob/Documents/CompressionImpactCNN/CNN/j2k.csv")
#AJOUT DE PNG
files <- list.files(path="./j2k/outputImg/", pattern="*.j2k", full.names=TRUE, recursive=FALSE)
#sizes <- rbind(sizes, file.size("./jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="./inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  
  pathInput <- gsub(" ", "", pathInput)
  compressionRate = file.size(pathInput)/file.size(file)
  
  tmp <- data.frame("name" = basename(file.path(file)),"format"="j2k" , "compressionRate"= compressionRate, "SSIM" = pngCsv$SSIM[pngCsv$File_Name == basename(file.path(file))], "PSNR" = j2kCsv$PSNR[j2kCsv$File_Name == basename(file.path(file))], "rank"= j2kCsv$rank[j2kCsv$File_Name == basename(file.path(file))], "rank_diff"= j2kCsv$Rank_Diff[j2kCsv$File_Name == basename(file.path(file))])
  
  sizes <- rbind(sizes, tmp)
}