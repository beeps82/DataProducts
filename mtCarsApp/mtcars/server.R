library(shiny)
library(datasets)
library(ggplot2)

data(mtcars)

mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
mtcars$disp<- round(mtcars$disp/50)*50
mtcars$hp<- round(mtcars$hp/50)*50
mtcars$wt<- round(mtcars$wt)

names<- gsub("([A-Za-z]+).*", "\\1", rownames(mtcars))
mtcars$manufacture<- gsub("(^[[:space:]]+|[[:space:]]+$)", "", names)


# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {

  output$caption <- renderText({
    switch (input$param,
            cyl =  titl<- "Number of cylinders",
            am =   titl<- "Transmission Type",
            hp =   titl<- "Horse Power",
            wt =   titl<- "Weight in 1000 lbs",
            gear = titl<- "Number of gears",
            disp = titl<- "Displacement",
            carb = titl<- "Number of Carburetors",
            vs  =  titl<- "V/S"
    )
    print(paste('MPG vs. ', titl))
  })
  

  output$mpgPlot <- renderPlot({
        switch (input$param,
                cyl =  titl<- "Number of cylinders",
                am =   titl<- "Transmission Type",
                hp =   titl<- "Horse Power",
                wt =   titl<- "Weight in 1000 lbs",
                gear = titl<- "Number of gears",
                disp = titl<- "Displacement",
                carb = titl<- "Number of Carburetors",
                vs  =  titl<- "V/S"
        )    
       
      switch(input$manufacturer,
             All = currD<- mtcars,
            {
             ind<- mtcars$manufacture == input$manufacturer 
             currD<- mtcars[ind,]}
            )
     

      par<- factor(currD[[input$param]])
      print(ggplot(data = currD, aes(x=par, y=mpg))+ 
             geom_boxplot(aes(fill = par)) +
             coord_flip() + ylab("MPG") + xlab(titl))
             })
})

