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

#2. Importación de datos---------------------------

mod200 <- read_dta("datos/crudos/enaho01-2024-200.dta") %>% rename_with(tolower)
mod500 <- read_dta("datos/crudos/enaho01a-2024-500.dta") %>% rename_with(tolower)
