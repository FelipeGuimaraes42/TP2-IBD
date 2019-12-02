##############################################
# 		GRÁFICOS TP2-IBD                 #
##############################################

dados<-read.csv("incendios_ano.csv", sep=";", dec=",", header=T)
dados
attach(dados)

# Gráfico de barras da soma dos incêndios por cada ano
barplot(numero_de_incendios, main = "Soma dos incêndios de 1998 a 2017", ylab= "Número de incêndios", xlab = "Ano", names = ano, col = rainbow(19), horiz = TRUE)

dados2<-read.csv("incendios_regiao.csv", sep=";", dec=",", header=T)
dados2
attach(dados2)

# Total de focos de incêndio de cada região
t1<- prop.table(c)
t1
pie(t1, labels = paste(paste(c("Centro-Oeste","Nordeste", "Norte", "Sudeste", "Sul"),round(prop.table(t1)*100,2), sep="-"), "%",sep=" "),
main="Total de focos de incêndio de cada região (1998-2017)", col = rainbow(5))

dados3<-read.csv("incendios_bioma.csv", sep=";", dec=",", header=T)
dados3
attach(dados3)

t2<-prop.table(total_incendios)
t2

# Total de focos de incêndio de cada bioma
pie(t2, labels = paste(paste(c("Pampa","Caatinga", "Pantanal", "Mata Atlântica", "Cerrado", "Amazônia"),round(prop.table(t2)*100,2), sep="-"), "%",sep=" "),
main="Total de focos de incêndio de cada bioma (1998-2017)", col = rainbow(6))

