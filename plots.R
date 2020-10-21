install.packages('jpeg')
library('jpeg')

rm(sizes)
files <- list.files(path="/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/", pattern="*.jpeg", full.names=TRUE, recursive=FALSE)
sizes <- data.frame("name" = character(),"size"= double(), "pixels"= double(), "compressionRate"=double())
#sizes <- rbind(sizes, file.size("/home/rob/Documents/CompressionImpactCNN/jpeg/outputImg/ILSVRC2012_val_00000023.2_1.jpeg"))
for (file in files){
  
  pathInput="/home/rob/Documents/CompressionImpactCNN/inputImg/"
  pathInput <- paste(pathInput, substr(basename(file.path(file)), 1, 23))
  pathInput <- paste(pathInput, ".JPEG")
  pathInput <- gsub(" ", "", pathInput)
  #file.size(pathInput)
  compressionRate = file.size(file)/file.size(pathInput)
  
  img <- readJPEG(file.path(file))
  pixels = ncol(img) * nrow(img)
  tmp <- data.frame("name" = basename(file.path(file)), "size" = file.size(file), "pixels"=pixels, "compressionRate"= compressionRate)
  
  sizes <- rbind(sizes, tmp)
}

