library(shiny)

ui <- fluidPage(
  actionButton("go", "go")
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
