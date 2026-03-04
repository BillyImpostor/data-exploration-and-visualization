#------------------------SYNTAX MODUL 1.1-------------------------------------#
#VARIABEL SATU NILAI
mydata = 3
mydata
my.data <- 5.5
my.data
dataku = ('hai dunia')
dataku
Dataku = "hello world"
Dataku
benar = TRUE
benar

#VEKTOR
c(1,2,F) #vektor terdiri dari data dengan mode logical
c("X",T) #vektor terdiri dari data dengan mode character dan logical
c("X",2,F) #vektor terdiri dari data dengan mode character, numeric, dan logical
x = c(2,3) #vektor x berisikan 2 dan 3
x

#EKSTRAKSI VEKTOR
y = c(3,9,15,21,6,5)
y
#menampilkan elemen pertama
y[1]
#menampilkan elemen pertama dan ketiga
y[c(1,3)]
#menampilkan semua elemen kecuali elemen ketiga
y[-3]
#menampilkan semua elemen kecuali elemen pertama dan ketiga
y[-c(1,3)]

#PEMBENTUKAN MATRIX
matriks1 <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3, ncol=3)
matriks1
matriks2 <- matrix(1:9,3)
matriks2

data = c(2,3,4,5,6,7)
#diisi per kolom
matriks3 <- matrix(data=data,nrow=3,ncol=2)
matriks3
#diisi per baris
matriks3 <- matrix(data=data,nrow=3,ncol=2, byrow=TRUE)
matriks3

#MANIPULASI MATRIKS
#Menggabungkan
#menggabungkan satu kolom baru atau satu baris baru ke matriks lain
mat<-matrix(c(4,7,8,6,4,4), nrow=2)
mat
#menambahkan kolom
mat1=cbind(mat,c(1,1))
mat1
mat2=cbind(c(1,1),mat)
mat2

#menambahkan baris
mat3=rbind(mat,c(1,1,1))
mat3
mat4=rbind(c(1,1,1),mat)
mat4

#Mengekstraksi
matrik=matrix(2:7,2)
matrik
#menampilkan baris ke 2 kolom 3 dari matrik
matrik[2,3]
#menampilkan elemen baris ke 2
matrik[2,]
#menampilkan elemen kolom 1
matrik[,1]

#DATA FRAME
#Pembentukan
nama = c("meme","mimi","mumu","momo")
usia = c(19,20,21,22)
kelas = c("A","B","C","C")
domisili = c("bantul","sleman","gunung kidul","bantul")
siswa = data.frame(nama,usia,kelas,domisili)
siswa

#Mengubah nama kolom pada data frame
names(siswa)[2]="umur"
siswa

#Ekstrasi Data Frame
#Menampilkan elemen kelas
#cara 1
siswa["kelas"] 
#cara 2
siswa[3]

#jika ingin output berupa vektor
#cara satu
siswa[,3]
#cara dua
siswa$kelas

#output sama tetapi nama kolom berbeda
as.data.frame(siswa[,3]) 

#menyimpan nama kolom yang baru ke dalam objek bernama coba
coba = as.data.frame(siswa[,3])
coba

#menyimpan elemen baris 2 sampai 4 dan kolom 1 sampai 2
new.df=siswa[2:4,1:2]
new.df 

#menampilkan elemen baris 1,3 dan kolom 2,4 dari data frame siswa
siswa[c(1,3),c(2,4)]

#menampilkan selain kolom ke tiga dari data frame siswa
siswa[,-3]

#menampilkan selain baris ke 4 dari dataframe siswa
siswa[-4,]

#menampilkan selain baris 3,4 dan kolom 1 dari data frame siswa
siswa[c(-3,-4),-1] 

#MENGIMPORT DATA
#Excel
#sebelumnya harus diinstall package
install.packages("openxlsx")
#memanggil library yang diperlukan
library(openxlsx)
#membaca data dari file xlsx 
data1=read.xlsx("D:/R/Data Pertemuan 1.xlsx")

#Mengimpor data dari file csv
#membaca data dari file.csv 
data2=read.csv("D:/R")

#FUNGSI
#Fungsi bawaan
data3 <- mtcars #dataset yang telah tersedia di R
head(data3) #menampilkan 6 baris pertama (default)
head(data3, 3) #menampilkan 3 baris pertama
tail(data3) #menampilakan 6 baris terakhir (default)
tail(data3, 2) #menampilkan 2 baris terkahir
help(mtcars)
?mtcars
str(data3)
print(data3)
View(data3)

#Pembentukan fungsi sederhana
nilai_kuadrat <- function(x){
  hasil <- x^2
  hasil
}
angka1 <- 4
angka2 <- c(2,3,4)
nilai_kuadrat(angka1)
nilai_kuadrat(angka2)





#------------------------SYNTAX MODUL 1.2-------------------------------------#
## Daftar Tally
# Menginstall packages dplyr
install.packages("dplyr")

# Memanggil library dplyr
library(dplyr)

# Menggunakan data mtcars
mtcars
help(mtcars) # informasi data

# Membuat daftar tally dengan menggunakan data nilai
daftar_tally <- mtcars %>%
  #Mengelompokan data berdasarkan data pada kolom carburetors (carb)
  group_by(carb) %>%
  #Membuat perhitungan tally
  tally() %>%    
  #Menambah variabel percent
  mutate(Percent = n/sum(n)*100) %>%   
  #Menambah variabel cumulative count
  mutate(CumCnt = cumsum(n)) %>%    
  # Menambah variabel cumulative percent
  mutate(CumPct = cumsum(Percent))      

# Memanggil daftar tally
daftar_tally

## Stem and Leaf Plot

#Memanggil data river
rivers
help(rivers) # informasi data

# Nilai Minimum data Rivers
min(rivers)

# Nilai Maximum data Rivers
max(rivers)

#Membuat stem and leaf plot dengan scale = 1
stem(rivers)

#Membuat stem and leaf plot dengan scale = 2
stem(rivers, scale = 2)

#Membuat stem and leaf plot dengan scale = 0.5
stem(rivers, scale = 0.5)



# Memanggil data Orange
Orange
help(Orange)

# Nilai minimum data circumference
min(Orange$circumference)

# Nilai maksimum data circumference
max(Orange$circumference)

#Membuat stem and leaf plot dengan scale = 1
stem(Orange$circumference)

#Membuat stem and leaf plot dengan scale = 2
stem(Orange$circumference, scale = 2)


## Ringkasan Numerik
# Input data
data <- c(5, 5, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 10, 20)

# Mencari nilai Mean
mean(data)

# Mencari nilai median
median(data)

# Mencari nilai modus
getModes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  max_tab <- max(tab)
  modes <- ux[tab == max_tab]
  return(modes)
}
getModes(data)

#Mencari nilai Kuartil
quantile(data) #Mendapatkan semua nilai 
quantile(data,probs = 0.25) #Kuartil Bawah = q1
quantile(data,probs = 0.50) #Kuartil Tengah = Median = q2
quantile(data,probs = 0.75) #Kuartil Atas = q3

# Range
range_data <- range(data)
range_value <- range_data[2] - range_data[1] # Menghitung range
range_value

# Atau bisa menggunakan syntax berikut
range_data2 <- max(data) - min(data)
range_data2

# Interquartile Range (IQR)
iqr_value <- IQR(data)
iqr_value

# Mean Deviasi
mean_deviation <- mean(abs(data - mean(data)))
mean_deviation

# Variansi
variance <- var(data)
variance

# Standar Deviasi
std_deviation <- sd(data)
std_deviation

# Simultan
summary(data)

# Menggunakan library "psych
library(psych)
describe(data)

