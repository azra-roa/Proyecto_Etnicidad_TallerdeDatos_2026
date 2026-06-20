#===========================================================================================
#Proyecto: Análisis de la relacion etnicidad-salario usando datos de la ENAHO
#Autorx: Azra Roa
#Objetivo de este script: Cargar modulos y hacer joins
#Fecha: 17-06-2026
#==========================================================================================

#1. Carga de librerias------------------------
library(rio)
library(janitor)
library(haven) 
library(dplyr) 
library(tidyr)
renv::snapshot()

#2. Importación de datos----------------------

mod200 <- read_dta("datos/crudos/enaho01-2024-200.dta") %>% rename_with(tolower)
mod500 <- read_dta("datos/crudos/enaho01a-2024-500.dta") %>% rename_with(tolower)

#3. Unión de bases----------------------------

keys_hogar <- c("año", "mes", "conglome", "vivienda", "hogar", "ubigeo", "dominio", 
                "estrato", "nconglome", "sub_conglome")
keys_persona <- c(keys_hogar, "codperso", "p203", "p204", "p205", 
                  "p206", "p207", "p208a", "p209")

enaho_2024 <- mod200 %>%
  left_join(mod500, by = keys_persona)

#4. Exportación de la base creada
install.packages("arrow")
library(arrow)
renv::snapshot()
write_parquet(enaho_2024, "datos/procesados/enaho_2024_170626.parquet")

