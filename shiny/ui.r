library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "NFL Combine "),
  sidebarLayout( position = "right",
    sidebarPanel(
      h3("Forty Yard Dash Time"),
        sliderInput("slider", "Select weight", min=185, max = 400, value = 225)
      
                 
    ),
                 
    mainPanel( 
                textOutput("oslide")
            
    
    )
  )
))