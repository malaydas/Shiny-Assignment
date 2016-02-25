library(shiny)
library(UsingR)
data(Galton)

shinyServer(
  function(input,output){
    childcalc<-0
    parentcalc=reactive({mean(c(input$mother,input$father))})
    #mod=lm(child~parent,data=Galton)
    mod=reactive({mod=lm(child~parent,data=Galton)})
    childcalc = eventReactive(input$calculate,{mod()$coeff[2]*parentcalc() + mod()$coeff[1]})
    output$child <- renderText(if(input$calculate==0) 62.71897 else childcalc())
     }
)