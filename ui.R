
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(Cairo)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
    # Show a plot of the generated distribution
    fluidPage(
      fluidRow(
        column(width=12,
        plotOutput("distPlot",
                   # Equivalent to: click = clickOpts(id = "plot_click")
                   click = "plot_click",
                   dblclick = dblclickOpts(
                     id = "plot_dblclick"
                   ),
                   hover = hoverOpts(
                     id = "plot_hover"
                   ),
                   brush = brushOpts(
                     id = "plot_brush"
                   )
      )),
      fluidRow(
        column(width = 3, verbatimTextOutput("click_info")),
        column(width = 3, verbatimTextOutput("dblclick_info")),
        column(width = 3, verbatimTextOutput("hover_info")),
        column(width = 3, verbatimTextOutput("brush_info"))
      )
  )
)))
