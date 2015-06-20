library(shiny)
library(ggplot2)

function(input, output) {
  
  dataset <- mtcars
  
  output$plot <- renderPlot({
    
    p <- ggplot(dataset, aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth(size=2)
    if (input$trend)
      p <- p + geom_smooth(method='lm',color="red",size=2)
    
    print(p+theme_bw())
    
  }, height=700)
  
}
