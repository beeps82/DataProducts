library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Car Road Test"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "param", "Select a Parameter:",
                            c("Cylinders" = "cyl","Transmission" = "am", 
                              "Gears" = "gear",   "Carburetors" = "carb",
                              "Displacement" = "disp", "Horse Power" = "hp",
                              "Weight" = "wt", "V/S" = "vs"), width = '100%'),
      
      selectInput(inputId = "manufacturer",'Select manufacturer',
                  c("Select all" = "All",
                    "Mercedes" = "Merc",
                    "Mazda" = "Mazda",
                    "Hornet" = "Hornet",
                    "Toyota" = "Toyota"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOutput("caption")),
      plotOutput(outputId = "mpgPlot", width = "100%", height = "300px")
    )
  )
))
