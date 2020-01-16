#LOAD DATA
train_gold <- read.csv('train_gold.csv', header = TRUE)
train_oil <- read.csv('train_oil.csv', header = TRUE)

#EKSPLORASI DATA
#melihat struktur dataset
str(train_gold)
str(train_oil)
#menampilkan banyak baris & kolom dataset
dim(train_gold)
dim(train_oil)
#melihat 6 baris dataset pertama
head(train_gold)
head(train_oil)
#melihat 6 baris dataset terakhir
tail(train_gold)
tail(train_oil)
#menampilkan statistika deskriptif dataset
summary(train_gold)
summary(train_oil)

# extract only required data from dataset
trX <- df[1:n_dim, 1:(seq_len * num_samples)]
# the label data(next output value) should be one time 
# step ahead of the current output value
trY <- df[7, 2:(1+(seq_len * num_samples))]

trainX <- trX
dim(trainX) <- c(n_dim, seq_len, num_samples)
trainY <- trY
dim(trainY) <- c(seq_len, num_samples)

#FORECAST
library(neuralnet)
library(keras)
library(kerasformula)
library(kerasR)
library(rnn)
run.rnn_demo()

batch.size <- 32
train_ids <- 1:300
eval_ids <- 301:400

## create data iterators
train.data <- mx.io.arrayiter(data = trainX[,,train_ids, drop = F],
                              label = trainY[, train_ids], batch.size = batch.size, shuffle = TRUE)

eval.data <- mx.io.arrayiter(data = trainX[,,eval_ids, drop = F], label = trainY[, eval_ids],
                             batch.size = batch.size, shuffle = FALSE)

## Create the symbol for RNN
symbol <- rnn.graph(num_rnn_layer = 2,
                    num_hidden = 50,
                    input_size = NULL,
                    num_embed = NULL,
                    num_decode = 1,
                    masking = F, 
                    loss_output = "linear",
                    dropout = 0.5, 
                    ignore_label = -1, 
                    cell_type = "lstm", 
                    output_last_state = T,
                    config = "one-to-one")

## Extracting the state symbols for RNN

internals <- model$symbol$get.internals()
sym_state <- internals$get.output(which(internals$outputs %in% "RNN_state"))
sym_state_cell <- internals$get.output(which(internals$outputs %in% "RNN_state_cell"))
sym_output <- internals$get.output(which(internals$outputs %in% "loss_output"))
symbol <- mx.symbol.Group(sym_output, sym_state, sym_state_cell)
