#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("DIC_Lab1 - arane2_nmirashi"),
  
  # Sidebar panel for inputs ----
  sidebarPanel("Analyse What you Want",
               
               
               radioButtons("radio", label = h3("Select Your Graph"),
                            choices = list("CDC Heat Map" = 1, "Twitter Heat Map" = 2, "CDCvTwitter_All" = 3, "CvT only Flu_Influenza" = 4,  "CvT only Flu" = 5), 
                            selected = 1)
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    
    "PLOTS:",
    #textOutput("txt"),
    #column(9,plotOutput(outputId="plotgraph", width="500px",height="400px")),
    plotOutput(outputId="preImage", width="100px",height="10px", inline = FALSE)
  )
)
# Define server logic required to draw a histogram
server <- function(input, output) 
  
{
  
  output$preImage <- renderImage({
    # When input$n is 3, filename is ./images/image3.jpeg
    if(input$radio == "1"){
      filename <- normalizePath(file.path('CDC.jpeg'))
      output$txt <- renderText({
        paste("")
      })
    }
    
    else if(input$radio == "2"){
      filename <- normalizePath(file.path('All tweets heat.jpeg'))
      output$txt <- renderText({
        paste("")
      })
    }
    
    else if(input$radio == "3"){
      filename <- normalizePath(file.path('CDC_ALL.jpg'))
      output$txt <- renderText({
        paste("")
      })
    }
    
    else if(input$radio == "4"){
      filename <- normalizePath(file.path('CDC_IF.jpg'))
      output$txt <- renderText({
        paste("You chose")
      })
    }
  
    else if(input$radio == "5"){
      filename <- normalizePath(file.path('CDC_FLU.jpg'))
      output$txt <- renderText({
        paste("You chose")
      })
    }
    
      
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image number", input$radio))
    
  }, deleteFile = FALSE)
  
}
# Run the application 
shinyApp(ui = ui, server = server)



