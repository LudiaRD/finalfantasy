# finalfantasy (nama hanya digunakan untuk pengalihan nama lain dari final project)
Data yang ada disini merupakan semua yang dibutuhkan tugas akhir dengan judul "PERAMALAN HARGA EMAS DUNIA MENGGUNAKAN METODE RECURRENT NEURAL NETWORK (RNN)"

Berikut keterangan isi dari setiap file :
- dataset : "date" (tanggal pada hari kerja yang sudah disamakan 5 hari dalam seminggu dalam kurun waktu 1 Jan 2014 - 1 Jan 2019), "gold" (harga closing emas dunia sesuai dengan tanggal pada saat itu), "oil" (harga closing minyak WTI dunia sesuai dengan tanggal pada saat itu)
- dataset1 : "date" (tanggal pada hari kerja yang sudah disamakan 5 hari dalam seminggu dalam kurun waktu 1 Jan 2015 - 1 Jan 2020), "gold" (harga closing emas dunia sesuai dengan tanggal pada saat itu), oil (harga closing minyak WTI dunia sesuai dengan tanggal pada saat itu)
- train : Pembagian data 70% dari dataset (sebanyak 913 baris data)
- test : Pembagian data 30% dari dataset (sebanyak 122 baris data)
- train_norm : File train yang yang telah dinormalisasi (0-1)
- test_norm : File test yang yang telah dinormalisasi (0-1)
- RNN(Angka) : File yang berisi kodingan peramalan rnn dengan periode sesuai angka tersebut, yang mana masing-masing periode dibedakan berdasarkan variabel yang digunakan, univariate dan multivariate 
