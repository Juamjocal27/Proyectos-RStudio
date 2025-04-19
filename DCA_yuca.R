# DISEÑO COMPLETAMENTE AL AZAR
# Definir directorio de trabajo -------------------------------------------
getwd()
setwd("D:/Proyectos RStudio/Diseños Experimentales Agronomia/")
getwd()

# librerias ---------------------------------------------------------------
library(readxl)
library(agricolae)

# Abrir archivo .xlsx -----------------------------------------------------
ruta <- "./datos/T_28855_DCA_Yuca.xlsx"
datos <- read_excel(ruta,
                    sheet = 'Matriz',
                    range = 'A1:I41')

# Consulta ----------------------------------------------------------------
str(datos)
head(datos)

# ANOVA -------------------------------------------------------------------
datos$`Altura(cm)` <- as.factor(datos$`Altura(cm)`)
attach(datos)
dca <- aov(datos$`Altura(cm)`~ datos$TRATAMIENTO, data = datos)
dca <- aov(`Altura(cm)` ~ TRATAMIENTO, datos)
summary(dca)

# Ejemplo de calculo ------------------------------------------------------
datos <- data.frame(Tratamiento = c("T1", "T1", "T1", "T1", "T1", "T2", "T2", "T2", "T2", "T2", "T3", "T3", "T3", "T3", "T3"),
                    Respuesta = c(11, 10, 8, 8, 9, 8, 11, 13, 14, 9, 10, 6, 5, 8, 4))

# ANOVA -------------------------------------------------------------------
modelo <- aov(Respuesta ~ Tratamiento, data = datos)
summary(modelo)

anova <- function(a, b, c){
  
}
