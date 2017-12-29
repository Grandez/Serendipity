library(highcharter)

shinyUI(fixedPage(
  fixedRow(column(12,highchartOutput('plot')))
  )
)