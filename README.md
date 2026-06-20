# Análisis de la relación etnicidad-salario usando datos de la ENAHO: Proyecto Etnicidad Taller de Datos 2026

## Descripción del proyecto:

Este proyecto es una investigación con respecto a los ingresos y en qué medida clasificaciones sociales, en particular la identificación étnico/racial, siguen siendo relevantes como ejes que organizan las relaciones de producción en el mercado peruano contemporáneo.

Este repositorio contiene el codigo y el fluyo de trabajo utilizado para la realizacion del Proyecto Etnicidad 2026, realizado para el curso Taller de Procesamiento de Datos (1SOC03-0731) de la Pontificia Universidad Católica del Perú.

Los datos utilizados provienen de los módulos 2 y 5 de la Encuesta Nacional de Hogares (ENAHO) realizada por el Instituto Nacional de Estadística e Informática (INEI) del Perú. Los mismos han sido trabajados en R, lenguaje en el cual se encuentra el codigo de los scripts.

El análisis explora la relacion entre los ingresos (Variable dependiente) y la etnicidad (variable independiente), considerando controles para el modelo creado. Las variables utilizadas se pueden visualizar en la siguiente tabla:

+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
|                       |                                |                                                                           |                                                                      |
+=======================+================================+===========================================================================+======================================================================+
|                       | **Módulo en que se encuentra** | **Descripción**                                                           | **Leyenda**                                                          |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Ingresos (D524A1)** | Módulo 5                       | Ingreso total de la ocupación principal en Nuevos Soles                   | Valor numérico en Soles                                              |
|                       |                                |                                                                           |                                                                      |
|                       |                                |                                                                           | 999999 - Missing Value                                               |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Etnicidad (P558C)** | Módulo 5                       | Por sus antepasados y de acuerdo a sus costumbres la persona se considera | 1.  Quechua                                                          |
|                       |                                |                                                                           | 2.  Aimara                                                           |
|                       |                                |                                                                           | 3.  Nativo o Indígena de la Amazonía                                 |
|                       |                                |                                                                           | 4.  Negro/Moreno/Zambo/Mulato/Pueblo Afro peruano o Afrodescendiente |
|                       |                                |                                                                           | 5.  Blanco                                                           |
|                       |                                |                                                                           | 6.  Mestizo                                                          |
|                       |                                |                                                                           | 7.  Otro                                                             |
|                       |                                |                                                                           | 8.  No sabe/No responde                                              |
|                       |                                |                                                                           | 9.  Perteneciente o parte de otro pueblo indígena u originario       |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Sexo (P207)**       | Modulo 2                       | Sexo de la persona encuestada                                             | 1.  Hombre                                                           |
|                       |                                |                                                                           | 2.  Mujer                                                            |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Edad (P208A)**      | Módulo 2                       | Edad de la persona en años cumplidos                                      | 1-98 años                                                            |
|                       |                                |                                                                           |                                                                      |
|                       |                                |                                                                           | 99 - Missing Value                                                   |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Estrato (Estrato)** | Módulo 5                       | Estrato geográfico                                                        | 1.  De 500 000 a más habitantes                                      |
|                       |                                |                                                                           | 2.  De 100 000 a 499 999 habitantes                                  |
|                       |                                |                                                                           | 3.  De 50 000 a 99 999 habitantes                                    |
|                       |                                |                                                                           | 4.  De 20 000 a 49 999 habitantes 5.De 2 000 a 19 999 habitantes     |
|                       |                                |                                                                           | 5.  De 500 a 1 999 habitantes                                        |
|                       |                                |                                                                           | 6.  Área de Empadronamiento Rural (AER) Compuesto                    |
|                       |                                |                                                                           | 7.  Área de Empadronamiento Rural (AER) Simple                       |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+
| **Dominio (Dominio)** | Módulo 5                       | Dominio geográfico                                                        | 1.  Costa Norte                                                      |
|                       |                                |                                                                           | 2.  Costa Centro                                                     |
|                       |                                |                                                                           | 3.  Costa Sur                                                        |
|                       |                                |                                                                           | 4.  Sierra Norte                                                     |
|                       |                                |                                                                           | 5.  Sierra Centro                                                    |
|                       |                                |                                                                           | 6.  Sierra Sur                                                       |
|                       |                                |                                                                           | 7.  Selva                                                            |
|                       |                                |                                                                           | 8.  Lima Metropolitana                                               |
+-----------------------+--------------------------------+---------------------------------------------------------------------------+----------------------------------------------------------------------+

: *Tabla de variables control utilizadas (Datos: ENAHO)*

## Programas y librerías utilizadas:

El presente proyecto ha sido realizado utilizando el software **R** en su version 4.6.0, las librerías que han sido usadas para el mismo son las siguientes:

- \`rio\` y \`haven\` : Importación de bases de datos

- \`tidyverse\` : Procesamiento de bases y creación de gráficos

- \`dplyr\` : Limpieza de las bases de datos para su posterior análisis

- \`arrow\` : Exportación e importación de bases de datos en formato .parquet

- \`janitor\` : Limpieza de nombres de las variables de las bases de datos de la ENAHO

La versión de las librerías se ha controlado utilizando \`renv\`

## Estructura del directorio:

El directorio ha sido organizado utlizando la siguiente estructura de carpetas:

- Creación de carpetas - *(Script en el cual se crean las carpetas del proyecto)*

- Datos - *(Ubicación de los datos utilizados)*

  - Crudos - *(Carpeta en la cual se ubican las bases de datos directamente descargadadas del INEI)*

  - Procesados - (*Carpeta en la cual se ubican las bases de datos una vez trabajadas)*

- Outputs - *(Carpeta en la cual se ubican graficos, tablas y otros productos generados a partir de la data analizada)*

- Docs - *(Carpeta en la cual se ubican los documentos resultantes del analisis de la data, en modo de informe)*

- Scripts - *(Carpeta que contiene los scripts utilizados para la realización del Proyecto Etnicidad)*

  - 01_Carga_Unión_Modulos: Script en el cual se suben los modulos 2 y 5 de la ENAHO y se unen mediante un join.

  - 02_Limpieza_Acondicionamiento: Script en el cual se realiza la seleción de variables, cambio de nombre de las mismas y se toman decisiónes sobre los NAs.

  - 03_Exploración_Data: Script en el cual se realizan una exploración de cada variable en terminos de distribución, estadisticos descriptivos, dispersión y distribución. Se realizan gráficos con respecto a lo explorado.

  - 04_Informe_Final: Con respecto a lo explorado se realiza un informe pertinente en cuanto a la pregunta de investigación

- renv - *(Carpeta que contiene la información sobre la versión de las librerias utilizadas)*

  - renv.lock: Capsula del tiempo, Registro exacto de la versión de las librerias utilizadas

- gitignore - *(Documento que contiene la información sobre los archivos que git debe ignorar)*

- readme - *(Documento que contiene toda la información sobre la realización y la organización del proyecto)*
