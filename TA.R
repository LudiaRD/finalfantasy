#LOAD DATA
gold <- read.csv('gold.csv', header = TRUE)
  #ubah nama kolom
  colnames(gold)[colnames(gold) == "ï..date"] <- "date"
  
#EKSPLORASI DATA
  #melihat struktur dataset
  str(gold)
  #menampilkan banyak baris & kolom dataset
  dim(gold)
  #melihat 6 baris dataset pertama
  head(gold)
  #melihat 6 baris dataset terakhir
  tail(gold)
  #menampilkan statistika deskriptif dataset
  summary(gold)
  
#PEMBAGIAN DATA
train_size <- nrow(gold)*0.7
train <- gold[0:train_size, ]
test <- gold[-train, ]

#VISUALISASI DATA
library(ggplot2)
line_graph <- ggplot(gold, aes(x = date, y = price)) + geom_line(color = 'blue')
