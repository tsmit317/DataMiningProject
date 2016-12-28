library(shiny)

shinyServer(
  function(input, output){
    output$oslide <-renderText(input$slider)
    
   
    
    
  }
  
  
)