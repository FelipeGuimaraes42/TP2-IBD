##############################################
# 		GR�FICOS TP2-IBD                 #
##############################################

dados<-read.csv("incendios_ano.csv", sep=";", dec=",", header=T)
dados
attach(dados)

# Gr�fico de barras da soma dos inc�ndios por cada ano
barplot(numero_de_incendios, main = "Soma dos inc�ndios de 1998 a 2017", ylab= "N�mero de inc�ndios", xlab = "Ano", names = ano, col = rainbow(19), horiz = TRUE)

dados2<-read.csv("incendios_regiao.csv", sep=";", dec=",", header=T)
dados2
attach(dados2)

# Total de focos de inc�ndio de cada regi�o
t1<- prop.table(c)
t1
pie(t1, labels = paste(paste(c("Centro-Oeste","Nordeste", "Norte", "Sudeste", "Sul"),round(prop.table(t1)*100,2), sep="-"), "%",sep=" "),
main="Total de focos de inc�ndio de cada regi�o (1998-2017)", col = rainbow(5))

dados3<-read.csv("incendios_bioma.csv", sep=";", dec=",", header=T)
dados3
attach(dados3)

t2<-prop.table(total_incendios)
t2

# Total de focos de inc�ndio de cada bioma
pie(t2, labels = paste(paste(c("Pampa","Caatinga", "Pantanal", "Mata Atl�ntica", "Cerrado", "Amaz�nia"),round(prop.table(t2)*100,2), sep="-"), "%",sep=" "),
main="Total de focos de inc�ndio de cada bioma (1998-2017)", col = rainbow(6))

