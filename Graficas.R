
#-------------- Gràficos--------------------
# Matriz penguins, se encuentra en classroom

#-------------------------------------------
#Importaciòn de matriz
#-------------------------------------------

# import data / from excel /browse / seleccionar archivo / aceptar   

#-------------------------------------------
#  Exploraciòn
#-------------------------------------------

dim(penguins_1_)

# Nombre de las variables
colnames(penguins_1_)

# Tipos de variables
str(penguins_1_)


#En busca de valores perdidos (NA`S`)
anyNA(penguins_1_)

#Estadistica descriptiva
summary(penguins_1_)

#------------------------------------------
#  Configuraciòn de la matriz
#------------------------------------------

# 1.- Convertir las variables categoricas a factores
penguins_1_$especie<-factor(penguins_1_$especie,
                            levels=c("Adelie","gentoo","chinstrap"))


penguins_1_$isla<-factor(penguins_1_$isla,
                            levels=c("Torgersen","Biscoe","Dream"))


penguins_1_$genero<-factor(penguins_1_$genero,
                            levels=c("male","female"))

penguins_1_$año<-factor(penguins_1_$año,
                            levels=c("2007","2008","2009"))

str(penguins_1_)

summary(penguins_1_)

View(penguins_1_)

#´-----Este paso no es necesario
# 2.- Creamos una nueva matriz de datos donde se seleccionan
#     las columnas de la 2 a la 9



#--------------------------------------
#   Librerias
#--------------------------------------
install.packages("ggplot2")



#--------------------------------------
#     Boxplot
#--------------------------------------

# 1.- Creaciòn de un vector de color
color=c("lightsalmon2", "lightsteelblue1")

#  2.- Creaciòn del grafico

BX<-ggplot(penguins_1_,aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("Género")+
  ylab("largo de la aleta (mm)")+
  theme_bw()

# 3. Visualizaciòn del boxplot
BX

#----------------------------------
#    Gràfico de barras
#----------------------------------

#1.- Creaciòn de un vector de color
color=c("darkseagreen","lavenderblush3", "lemonchiffon1")

# 2.- Creaciòn del gràfico
GB1<-ggplot(penguins_1_,aes(x=año))+
  geom_bar(color="black",fill=color)+
  ggtitle("Gràfico de barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  theme_minimal()

#3.- Visualizaciòn del grafico
GB1

#4.- Barras verticales

GB2<-ggplot(penguins_1_,aes(x=año))+
  geom_bar(color="black",fill=color)+
  ggtitle("Gràfico de barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()

#5.- Visualizaciòn del objeto
GB2

#---------------------------------------
#  Histograma
#---------------------------------------

#1.- Construcciòn del gràfico

HG<-ggplot(penguins_1_,aes(x=largo_aleta_mm))+
  geom_histogram(color="black",fill="paleturquoise")+
  ggtitle("Histograma")+
  xlab("Largo de la aleta (mm)")+
  ylab("Frecuencias")+
  theme_classic()

# 2.- Visualizaciòn del grafico
HG

#-------------------------------------
# Grafico de dispersion
#-------------------------------------

#Construcciòn del gràfico

GD<-ggplot(penguins_1_,aes(x=largo_pico_mm,y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  ggtitle("Gràfico de dispersiòn")+
  xlab("largo del pico (mm)")+
  ylab("grosor del pico (mm)")+
  theme_linedraw()

# 2.- Visualizaciòn del objeto
GD

#----------------------
# Organizaciòn de gràficos
#----------------------------

# 1.- Descargar el paquete gridExtra

install.packages("gridExtra")

# 2.- Abrir la libreria
library(gridExtra)

# 3.- Organizacuòn 2 gràficos en una fila y dos columnas 
grid.arrange(BX,GB2, nrow=1,ncol=2)

# 4.- Organizacuòn 3 gràficos en dos fila y dos columnas 
grid.arrange(BX,GB2,HG, nrow=2,ncol=2)

# 5.- Organizacuòn 4 gràficos en dos fila y dos columnas 
grid.arrange(BX,GB2,HG,GD, nrow=2,ncol=2)
