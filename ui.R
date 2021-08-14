library(shiny)
library(shinythemes)

ui <- navbarPage(theme = shinytheme("flatly"),
                 "Tokyo 2020 Olympics Medal List by Luis Ballesteros 2021/08/11",
                 
                 tabPanel(icon("home"),
                          fluidRow(column(tags$img(src="Summer_Olympics_tokyo_2020.png",
                                                   width="275px",
                                                   align = "center"),width=2),
                                   column(
                                       
                                       br(),
                                       p('This App has been created as an exercise of the course Developing Data Products by Johns Hopkins University on the ", a(href="https://www.coursera.org/learn/data-products/home/welcome/", "Coursera platform.")',
                                         style="text-align:justify;color:black;background-color:lavender;padding:15px;border-radius:10px"),
                                       br(),
                                       
                                       p("The data used in this application are publicly available on the page of the", em("Anuario Estadístico de Antioquia"), "by the administrative planning department. 
                                          The data extracted from this public entity correspond to a series of social, educational, sports and safety variables in the rural areas of Antioquia in 
                                          Colombia for the year 2016.",style="text-align:justify;color:black;background-color:papayawhip;padding:15px;border-radius:10px"),
                                       
                                       width=10)))
                 ,
                 
                 # Panel title
                 tabPanel(icon("map"),
                          
                          # Sidebar with a slider input for number of bins 
                          sidebarLayout(
                              sidebarPanel(
                                  checkboxGroupInput("select_medal", 
                                                     "Select Medal", 
                                                     choices = list("Gold" = "Gold", 
                                                                    "Silver" = "Silver",
                                                                    "Bronze" = "Bronze")
                                  ),
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                  leafletOutput("mymap")
                              )))
                 
                 ,
                 tabPanel(icon("table"),
                          sidebarLayout(
                              sidebarPanel(
                                  
                                  selectInput(
                                      inputId = "variables",
                                      label = "Select the variables",
                                      choices = c("Country",
                                                  "Gold",
                                                  "Silver",
                                                  "Bronze",
                                                  "Total",
                                                  "Rank",
                                                  "cod_contry",
                                                  "lat",
                                                  "lng"),
                                      selected = "",
                                      multiple = TRUE
                                  )
                              ),
                              
                              # Show a plot of the generated distribution
                              mainPanel(
                                  dataTableOutput("country_medals")
                              )
                          ))
)
