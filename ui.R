library(shiny)
library(ggplot2)

dataset <- mtcars

head(dataset)

fluidPage(
  
  titlePanel("Mtcars Dataset Visualizer"),
  sidebarPanel(
    p("This app produces scatterplots for the well known R dataset ", em("mtcars")),
    h4("Instructions"),
    p("* Select variables", strong("X")," and ",strong("Y"),"at a minimum in order to generate a plot (the first two variables are selected by default)"),
    p("* Colored dots can be specified with the ", strong("Color")," variable"),
    p("* Facets (or grids) can be also selected from the list, default plot has no facets"),
    p("* Additional features can be added to the plot by clicking on the checkboxes"),
    br(),
    selectInput('x', 'X', names(dataset),"wt"),
    selectInput('y', 'Y', names(dataset),"mpg"),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset)[c(2,8,9,10,11)])),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)[c(2,8,9,10,11)])),
    
    p(strong("Some additional options:")),
    checkboxInput('jitter', 'Jitter?'),
    checkboxInput('smooth', 'Smooth Line?'),
    checkboxInput('trend', 'Regression Line?')
  ),
  
  mainPanel(
    h2("Your resulting plot:"),
    plotOutput('plot')
  )
)
