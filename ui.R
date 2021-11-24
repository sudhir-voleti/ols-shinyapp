####################################################
#      Summary & OLS App                           #
####################################################

library("shiny")
#library("foreign")

shinyUI(fluidPage(
  # Header:
  #headerPanel("OLS App"),
  titlePanel(title=div(img(src="logo.png",align='right'),"OLS App")),
  # Input in sidepanel:
  sidebarPanel(

    h5(p("Data Input")),
    fileInput("file", "Upload input data (csv file with header)"),
    fileInput("filep", "Upload prediction data (csv file with header)"),
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
                         
                         h4(p("Download Sample Input Files")),
                         # br(),
                         downloadButton('downloadData', 'Download model training input file (works only in browsers)'),
                         br(),
                         br(),
                         downloadButton('downloadData2', 'Download prediction input file (works only in browsers)'),
                         
                         br()
                         
                         
                ),
                
                tabPanel("Summary Stats", 
                         verbatimTextOutput("summary")),
                tabPanel("Correlation", 
                         verbatimTextOutput("correlation"),
                         plotOutput("heatmap")),
                tabPanel("Summary OLS", 
                         h4("Summary OLS Model"),
                         verbatimTextOutput("olssummary"),
                         h4("Summary OLS standardized model"),
                         verbatimTextOutput("olssummarystd")),
                tabPanel("Residuals Plot",
                         h4("Fitted Values vs Residuals"),
                         plotOutput("resplot2"),
                         h4("Fitted Values vs Y"),
                         plotOutput("resplot3"),
                         h4("Residuals plot"),
                         plotOutput("resplot1")),
                tabPanel("Data with predicted Y",tableOutput("datatable")),
                tabPanel("Prediction",br(),
                         h4("First 10 rows of predicted data"),
                         p('"Yhat" column is the predicted value.'),
                         verbatimTextOutput('prediction'),
                         h4("Download Predicted Data"),
                         downloadButton('downloadData1', 'Download Predicted Data')
                )                

                )
      ) 
    ) 
  )
