####################################################
#      OLS App    #
####################################################

library("shiny")
#library("foreign")

shinyUI(pageWithSidebar(
  # Header:
  headerPanel("OLS App"),
  # Input in sidepanel:
  sidebarPanel(

    h5(p("Data Input")),
    fileInput("file", "Upload input data (csv file with header))"),
    
    h5(p("Data Selection")),
    htmlOutput("yvarselect"),
    htmlOutput("xvarselect"),
    htmlOutput("fxvarselect"),
    br()
  ),
  # Main:
  mainPanel( 
    
    tabsetPanel(type = "tabs",
                #
                
                tabPanel("Overview",
                         br()
                         ),
                
                tabPanel("Summary Stats", verbatimTextOutput("summary")),
                tabPanel("Correlation", verbatimTextOutput("correlation"),plotOutput("heatmap")),
                tabPanel("Summary OLS", h5("Summary OLS Model"),verbatimTextOutput("olssummary"),
                         h5("Summary OLS standardized model"),
                         verbatimTextOutput("olssummarystd")),
                tabPanel("Residuals Plot",h4("Fitted Values vs Residuals"),
                         plotOutput("resplot2"),h4("Fitted Values vs Y"),
                         plotOutput("resplot3"),h4("Residuals plot"),
                         plotOutput("resplot1")),
                tabPanel("Data with predicted Y",tableOutput("datatable"))
                
                

                )
      ) 
    ) 
  )
