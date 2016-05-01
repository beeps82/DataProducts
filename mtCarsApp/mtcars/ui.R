library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Car Road Test"),
  
  h5(('This report by Motor Trend magazine investigates the relationship between
       a vehicle parameters and fuel consumption per gallon(MPG). This 
       is from the 1974 MotorTrend US magazine. It compromises of 11 aspects of 
        automobile design and performance for 32 automobiles(1973-74 models). 
       We will investigate the factors like transmission, cylinders, displacement,
       horse power, weight, qsec, gear and number of carburetors that contribute to performance. 
       Also investigate the effects of car manufacturers. 
       This app visualizes the individual effects of these parameters on vechicle performance in MPG.')),
  
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
