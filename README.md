# finalfantasy (nama hanya digunakan untuk pengalihan nama lain dari final project)
Data yang ada disini merupakan semua yang dibutuhkan tugas akhir dengan judul "PERAMALAN HARGA EMAS DUNIA MENGGUNAKAN METODE RECURRENT NEURAL NETWORK (RNN)"

Berikut keterangan isi dari setiap file :
- dataset : "date" (tanggal pada hari kerja yang sudah disamakan 5 hari dalam seminggu dalam kurun waktu 1 Jan 2014 - 1 Jan 2019), "gold" (harga closing emas dunia sesuai dengan tanggal pada saat itu), "oil" (harga closing minyak WTI dunia sesuai dengan tanggal pada saat itu)
- only_gold : Dari file dataset diambil kolom "date" dan "gold" saja
- only_oil : Dari file dataset diambil kolom "date" dan "oil" saja
- dataset1 : "date" (tanggal pada hari kerja yang sudah disamakan 5 hari dalam seminggu dalam kurun waktu 1 Jan 2015 - 1 Jan 2020), "gold" (harga closing emas dunia sesuai dengan tanggal pada saat itu), oil (harga closing minyak WTI dunia sesuai dengan tanggal pada saat itu)
- dataset_norm : "date" (tanggal pada hari kerja yang sudah disamakan 5 hari dalam seminggu dalam kurun waktu 1 Jan 2014 - 1 Jan 2019), "gold" (harga closing emas dunia sesuai dengan tanggal pada saat itu), "oil" (harga closing minyak WTI dunia sesuai dengan tanggal pada saat itu)
- train : Pembagian data 70% dari dataset (sebanyak 913 baris data)
- test : Pembagian data 30% dari dataset (sebanyak 122 baris data)
- train_norm : File train yang yang telah dinormalisasi menggunakan library BBmisc dengan method standarization
- train_norm1 : File train yang yang telah dinormalisasi menggunakan library BBmisc dengan method range
- test_norm : File test yang yang telah dinormalisasi menggunakan library BBmisc dengan method standarization
- test_norm1 : File test yang yang telah dinormalisasi menggunakan library BBmisc dengan method range
- train_gold : Hanya kolom "date" dan "gold" pada file train yang yang telah normalisasi menggunakan library BBmisc dengan method standarization
- train_oil : Hanya kolom "date" dan "oil" pada file train yang yang telah normalisasi menggunakan library BBmisc dengan method standarization
- norm_gold : Dari file train_norm diambil kolom "gold" saja
- norm_gold1 : Dari file train_norm1 diambil kolom "gold" saja
- norm_oil : Dari file train_norm diambil kolom "oil" saja
- norm_oil1 : Dari file train_norm1 diambil kolom "oil" saja
