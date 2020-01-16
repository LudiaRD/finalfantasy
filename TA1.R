#LOAD DATA
dataset <- read.csv('dataset.csv', header = TRUE)
  #ubah nama kolom
  colnames(dataset)[colnames(dataset) == "ï..date"] <- "date"
  
#EKSPLORASI DATA
  #melihat struktur dataset
  str(dataset)
  #menampilkan banyak baris & kolom dataset
  dim(dataset)
  #melihat 6 baris dataset pertama
  head(dataset)
  #melihat 6 baris dataset terakhir
  tail(dataset)
  #menampilkan statistika deskriptif dataset
  summary(dataset)

#PEMBAGIAN DATA
train_size <- nrow(dataset)*0.7
train <- dataset[0:train_size, ]
test <- dataset[-(0:train_size),]
  #write.csv(train, "train.csv")
  #write.csv(test, "test.csv")

#NORMALISASI DATA
library(BBmisc)
normalize(train, method = "standardize", range = c(0, 1), margin = 1L, on.constant = "quiet")
normalize(test, method = "standardize", range = c(0, 1), margin = 1L, on.constant = "quiet")
  #write.csv(normalize(train, method = "standardize", range = c(0, 1), margin = 1L, on.constant = "quiet"), "train_norm.csv")
  #write.csv(normalize(test, method = "standardize", range = c(0, 1), margin = 1L, on.constant = "quiet"), "test_norm.csv")

#FORECAST
library(neuralnet)
library(keras)
library(kerasformula)
library(kerasR)
library(rnn)
run.rnn_demo()

X1 <- read.csv('train_gold.csv', header = TRUE)
X2 <- read.csv('train_oil.csv', header = TRUE)

X1 <- int2bin(X1)
X2 <- int2bin(X2)
Y <- int2bin(Y)

X <- array(c(X1, X2), dim = c(dim(X1),1))
Y <- array(Y, dim = c(dim(Y),1))
#input1 <- as.vector(t(input))
#input2 <- unlist(input)
#inn = array(c(input1), dim = c(dim(input), 2))

model <- trainr(X, Y, learningrate = 9,
       learningrate_decay = 1, momentum = 0, hidden_dim = 10,
       network_type = "rnn", numepochs = 100,
       use_bias = F, batch_size = 1, seq_to_seq_unsync = F,
       update_rule = "sgd", epoch_function = c(epoch_print, epoch_annealing), loss_function = loss_L1)

predictr(model, train, hidden = FALSE, real_output = T)

plot(as.vector(train), col = 'blue', type = 'l', ylab = "Price", main = "Noisy waves")
lines(as.vector(Y), col = "red")
