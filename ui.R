library(shiny)
# shinyUI(navbarPage("My Application",
#                    tabPanel("Component 1"),
#                    tabPanel("Component 2"),
#                    tabPanel("Component 3")
# )

shinyUI( 
  mainPanel( 
  navbarPage(tags$em("Prediction - Using Linear Model"),position="static-top",
  tabPanel( tags$col("App"),
  fluidPage(
  titlePanel(h4("Predicting children's height")),
  br(),br(),
  fluidRow(
  column(
    numericInput(inputId="mother",label="Please enter Mother's height (in inch)",value=60),
    br(),
    numericInput(inputId="father",label="Please enter Father's height (in inch)",value=65),
    actionButton("calculate","calculate"),width=7
    ),
  column(
    br(),br(),
    p('Possible height of the children is :'),
    textOutput('child'),width=5
    )
  )
  )
  ),
  tabPanel(tags$col("Documentation"),
           tags$div(
             tags$p(" This app is simple demonstration of linear regression. 
                      I have choosen Galton's dataset (availabe in UsingR package)
                      to make a linear model for predicting children's height using 
                      their parents avarage height."), 
             tags$p("The whole idea is that, if you know both the parent's avarage height, 
                      you can predict their children's height."), 
             tags$p("Please enter the height of the parents and press the calculate button 
                    to get the children's height. By default , default values will be displayed"),
             tags$p("Linear model creation and averaging the parents height has been declared as 
                    reactive statements. This is done to ensure that the model creation and average
                    only happens when required.")
           )
    
  )
  )
  )
)



