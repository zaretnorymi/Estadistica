
#-------------- Gr�ficos--------------------
# Matriz penguins, se encuentra en classroom

#-------------------------------------------
#Importaci�n de matriz
#-------------------------------------------

# import data / from excel /browse / seleccionar archivo / aceptar   

#-------------------------------------------
#  Exploraci�n
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
#  Configuraci�n de la matriz
#------------------------------------------

# 1.- Convertir las variables categoricas a factores
penguins_1_$especie<-factor(penguins_1_$especie,
                            levels=c("Adelie","gentoo","chinstrap"))


penguins_1_$isla<-factor(penguins_1_$isla,
                            levels=c("Torgersen","Biscoe","Dream"))


penguins_1_$genero<-factor(penguins_1_$genero,
                            levels=c("male","female"))

penguins_1_$a�o<-factor(penguins_1_$a�o,
                            levels=c("2007","2008","2009"))

str(penguins_1_)

summary(penguins_1_)

View(penguins_1_)

#�-----Este paso no es necesario
# 2.- Creamos una nueva matriz de datos donde se seleccionan
#     las columnas de la 2 a la 9



#--------------------------------------
#   Librerias
#--------------------------------------
install.packages("ggplot2")



#--------------------------------------
#     Boxplot
#--------------------------------------

# 1.- Creaci�n de un vector de color
color=c("lightsalmon2", "lightsteelblue1")

#  2.- Creaci�n del grafico

BX<-ggplot(penguins_1_,aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("G�nero")+
  ylab("largo de la aleta (mm)")+
  theme_bw()

# 3. Visualizaci�n del boxplot
BX

#----------------------------------
#    Gr�fico de barras
#----------------------------------

#1.- Creaci�n de un vector de color
color=c("darkseagreen","lavenderblush3", "lemonchiffon1")

# 2.- Creaci�n del gr�fico
GB1<-ggplot(penguins_1_,aes(x=a�o))+
  geom_bar(color="black",fill=color)+
  ggtitle("Gr�fico de barras")+
  xlab("A�o")+
  ylab("Frecuencias")+
  theme_minimal()

#3.- Visualizaci�n del grafico
GB1

#4.- Barras verticales

GB2<-ggplot(penguins_1_,aes(x=a�o))+
  geom_bar(color="black",fill=color)+
  ggtitle("Gr�fico de barras")+
  xlab("A�o")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()

#5.- Visualizaci�n del objeto
GB2

#---------------------------------------
#  Histograma
#---------------------------------------

#1.- Construcci�n del gr�fico

HG<-ggplot(penguins_1_,aes(x=largo_aleta_mm))+
  geom_histogram(color="black",fill="paleturquoise")+
  ggtitle("Histograma")+
  xlab("Largo de la aleta (mm)")+
  ylab("Frecuencias")+
  theme_classic()

# 2.- Visualizaci�n del grafico
HG

#-------------------------------------
# Grafico de dispersion
#-------------------------------------

#Construcci�n del gr�fico

GD<-ggplot(penguins_1_,aes(x=largo_pico_mm,y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  ggtitle("Gr�fico de dispersi�n")+
  xlab("largo del pico (mm)")+
  ylab("grosor del pico (mm)")+
  theme_linedraw()

# 2.- Visualizaci�n del objeto
GD

#----------------------
# Organizaci�n de gr�ficos
#----------------------------

# 1.- Descargar el paquete gridExtra

install.packages("gridExtra")

# 2.- Abrir la libreria
library(gridExtra)

# 3.- Organizacu�n 2 gr�ficos en una fila y dos columnas 
grid.arrange(BX,GB2, nrow=1,ncol=2)

# 4.- Organizacu�n 3 gr�ficos en dos fila y dos columnas 
grid.arrange(BX,GB2,HG, nrow=2,ncol=2)

# 5.- Organizacu�n 4 gr�ficos en dos fila y dos columnas 
grid.arrange(BX,GB2,HG,GD, nrow=2,ncol=2)
