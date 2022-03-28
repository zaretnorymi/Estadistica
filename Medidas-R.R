
#_____________________ MEDIDAS ___________________

# Se trabajará con la matriz de datos "penguins.xlsx"


#-----------------------------------------------
#      Tendencia central
#-----------------------------------------------

# 1.- Media y mediana
summary(penguins_2_)


# 2.- Moda

# 2.1.- Se descarga el paquete "modeest"
install.packages("modeest")

# 2.2.- Se abre la librería
library(modeest)

# 2.3.- Cálculo de la moda para la variable isla y largo del pico
mfv(penguins_2_$isla) # categorica
mfv(penguins_2_$largo_pico_mm) # numerica

#-----------------------------------------------
#      Medidas de dispersión
#-----------------------------------------------

# 1.- Cálculo de la varianza (sólo para variables cuantitativas)
var(penguins_2_$grosor_pico_mm)

# 2.- Cálculo de la desviación estándar
sd(penguins_2_$grosor_pico_mm)

# 3.- Error
media_pico<-mean(penguins_2_$largo_pico_mm)
error<-(penguins_2_$largo_pico_mm-(media_pico))
error


#4.- Coeficiente de variacion
CV<- sd(penguins_2_$largo_pico_mm)/mean(penguins_2_$largo_pico_mm)*100
CV

# 5.- Rango intercuartilico (IQR)
IQR(penguins_2_$largo_pico_mm)

# 6.- Rango
pico<-penguins_2_$largo_pico_mm
rango<-max(pico)-min(pico)
rango

#-----------------------------------------------
#    Medidas de posición
#------------------------------------------------

# 1.- Cuartiles
summary(penguins_2_)

# 2.- Quintil
quintil<-quantile(penguins_2_[["largo_aleta_mm"]], 
                  p=c(.20, .40, .60, .80))
quintil

# 3.- Decil
decil<-quantile(penguins_2_[["largo_aleta_mm"]], 
                p=c(.10, .20, .30, .40, .50, .60,
                    .70, .80, .90))
decil

# Percentil
percentil<-quantile(penguins_2_[["largo_aleta_mm"]], 
                    p=c(.33, .66, .99))
percentil

# Interpretacion:
# <192 = Bajo
# 192-209 = Intermedio
# > 209 = Alto