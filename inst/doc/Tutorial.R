## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(PortalHacienda)

## ----search, results='hide', fig.keep='all', message = FALSE------------------
Series <- Search_online("Tipo de cambio")

## ----search2------------------------------------------------------------------
tail(Series,10)

## ----descarga-----------------------------------------------------------------
TCN <- Get("174.1_T_DE_CATES_0_0_32", start_date = "2010", timeout = 15)

## ----forecast-----------------------------------------------------------------
if (length(TCN) > 0)
TCN <- Forecast(TCN, N = 12 , confidence = c(80))

## ----graficar, fig.align= "center", fig.height= 3, fig.width= 7---------------
if (length(TCN) > 0){
tail(TCN, 10)
plot(TCN , main = "Tipo de Cambio Nominal ($/USD)")}

