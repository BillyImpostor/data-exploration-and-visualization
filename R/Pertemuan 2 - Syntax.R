#Import data BOD yang ada di R
data1 <- BOD
help(BOD)
data1

# Membuat line chart tanpa package
plot(data1$Time, data1$demand, type = "l", main = "Line Chart", xlab = "Time", ylab = "Demand")

#####Membuat line chart dengan library ggplot######
#Install package yang dibutuhkan
#install.packages('ggplot2')
library(ggplot2)


#Membuat simple line chart dengan data BOD
ggplot(data1, aes(x= Time, y = demand))+
  geom_line()

#Membuat line chart dengan variabel x berupa faktor
data1$Time <- factor(data1$Time)
ggplot(data1, aes(x = Time, y = demand, group = 1)) +
  geom_line()

#Mengatur rentang nilai y pada line chart
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  ylim(0, max(BOD$demand))
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  expand_limits(y = 0)

#####Membuat line chart interaktif dengan plotly
library(plotly)
plot <-ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  expand_limits(y = 0)
ggplotly(plot)

# Multiple Line Chart
# install.packages("gcookbook")
library(gcookbook) # Data yang akan digunakan
help("gcookbook") # Informasi tentang data
gcookbook::tg # Data ringkasan ToothGrowth

# Panggil library ggplot2 (untuk visualisasi)
library(ggplot2) # Advance
library(plotly) # Interaktif

# Membuat multiple line chart dengan warna yang berbeda untuk masing-masing kategori pada variabel supp di data tg
# Plot dengan fungsi ggplot() pada library ggplot2
# Versi kompleks
ggplot(tg, aes(x = dose, y = length, color = supp, linetype = supp)) +
  geom_line() +
  labs(title = "Multiple Line Chart", x = "Dose", y = "Length") +
  theme_minimal() +
  scale_color_manual(values = c("brown", "orange")) +
  scale_linetype_manual(values = c(1, 2))

# Versi sederhana
ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line() +
  labs(title = "Multiple Line Chart", x = "Dose", y = "Length")

# Plot dengan fungsi ggplotly() pada library plotly 
ggplotly(ggplot(tg, aes(x = dose, y = length, color = supp, linetype = supp)) +
           geom_line() +
           labs(title = "Multiple Line Chart", x = "Dose", y = "Length") +
           theme_minimal() +
           scale_color_manual(values = c("brown", "orange")) +
           scale_linetype_manual(values = c(1, 2)))

# Menyimpan dalam variabel plot
plot = ggplot(tg, aes(x = dose, y = length, color = supp, linetype = supp)) +
        geom_line() +
        labs(title = "Multiple Line Chart", x = "Dose", y = "Length") +
        theme_minimal() +
        scale_color_manual(values = c("brown", "orange")) +
        scale_linetype_manual(values = c(1, 2))
ggplotly(plot)

# Data
gcookbook::aapl # Data mengenai perubahan harga saham AAPL dalam mingguan
data = tail(gcookbook::aapl,100)

# Area Chart
# Area Chart dengan library(ggplot2)
ggplot(data, aes(x=date, y=adj_price)) +
  geom_area( fill="#69b3a2", alpha=0.4) +
  geom_line(color="brown", size=0.3) +
  labs(title = "Area Chart", x = "Date", y = "Weekly stock data of AAPL (Apple, Inc.)")

# Area Chart dengan library(plotly)
ggplotly(ggplot(data, aes(x=date, y=adj_price)) +
           geom_area( fill="#69b3a2", alpha=0.4) +
           geom_line(color="brown", size=0.3) +
           labs(title = "Area Chart", x = "Date", y = "Weekly stock data of AAPL (Apple, Inc.)"))

# Stacked Area Chart
library(gcookbook)
uspopage
help("uspopage")
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
geom_area(col = "black", size = 0.2, alpha = 0.9) +
  scale_fill_brewer(palette = "Reds") +
  labs(title = "Stack Area Chart", x = "Tahun", y = "Jumlah Penduduk")

