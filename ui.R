library(shiny)

shinyUI(
  fluidPage(
    titlePanel("The relationship between variables and miles per gallon (MPG)"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variable", "Variable:",
                    c("Number of cylinders" = "cyl",
                      "Displacement (cu.in.)" = "disp",
                      "Gross horsepower" = "hp",
                      "Rear axle ratio" = "drat",
                      "Weight (lb/1000)" = "wt",
                      "1/4 mile time" = "qsec",
                      "V/S" = "vs",
                      "Transmission" = "am",
                      "Number of forward gears" = "gear",
                      "Number of carburetors" = "carb"
                      )),
        checkboxInput("outliers", "Show outliers?", FALSE)
        ),
      mainPanel(
        h3(textOutput("caption")),
        tabsetPanel(type = "tabs",
                    tabPanel("BoxPlot", plotOutput("mpgBoxPlot"))
                    )
        )
      )
    )  
)