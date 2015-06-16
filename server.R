
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(dplyr)

  cardata <- diamonds %>% 
    group_by(cut, color) %>% 
    summarise(count=n())

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    ggplot(cardata, aes(y=count, x=cut, group=color, fill=color)) +
      geom_bar(stat="identity") +
      # geom_point() +
      coord_flip()
      
  })
    
  output$click_info <- renderPrint({
    cat("input$plot_click:\n")
    str(input$plot_click)
  })
  
  output$hover_info <- renderPrint({
    cat("input$plot_hover:\n")
    str(input$plot_hover)
  })
  
  output$dblclick_info <- renderPrint({
    cat("input$plot_dblclick:\n")
    str(input$plot_dblclick)
  })
  
  output$brush_info <- renderPrint({
    cat("input$plot_brush:\n")
    str(input$plot_brush)
  })

})
