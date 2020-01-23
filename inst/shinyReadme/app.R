if(!require("shiny")) install.packages('shiny')
if(!require("markdown")) install.packages('markdown')
if(!require("semantic.dashboard")) install.packages('semantic.dashboard')
if(!require("shiny.semantic")) install.packages('shiny.semantic')
if(!require("shinyjs")) install.packages('shinyjs')

library(shiny)
library(markdown)
library(semantic.dashboard)
library(shiny.semantic)
library(shinyjs)
library(V8)

source('icons.R')
source('ui.R')
source("functions.R")

ui <- dashboardPage(
  title = "ShinyReadme",
  header = myDashboardHeader(),
  sidebar = myDashboardSidebar(),
  body = myDashboardBody()
)

server <- function(input, output, session) {
  output$markdown <- renderUI({
    HTML(markdownToHTML(text = input$text, stylesheet = "", header = ""))
  })

  observeEvent(input$Githublink, {
    shinyjs::runjs("window.open('https://github.com/jhk0530', '_blank')")
  })

  observeEvent(input$Title, {
    hide("Title")
    Add("# :yellow_heart: Title")
    nextLine()
    Add("<hr>")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$Description, {
    hide("Description")
    Add("One Paragraph of project description goes here")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$Install, {
    hide("Install")
    Add("### :wrench: Install")
    nextLine()
    Add("A step by step series of examples")
    nextLine()
    nextLine()
    Add("that tell you how to get a development env running")
    nextLine()
    nextLine()
    Add("Say what the step will be")
    nextLine()
    nextLine()
    CodeArea("Give the example")
    nextLine()
    Add("And repeat")
    nextLine()
    CodeArea("until finished")
    nextLine()
    nextLine()
    Focus()
  })


  observeEvent(input$Dependency, {
    hide("Dependency")
    Add("### :paperclip: Dependency")
    nextLine()
    Add("* [component 1](http://link.here) - x.y.z")
    nextLine()
    Add("* [component 2](http://link.here) - x.y.z")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$Prerequisites, {
    hide("Prerequisites")
    Add("### :clipboard: Prerequisites")
    nextLine()
    Add("* [component 1](http://link.here) - x.y.z")
    nextLine()
    Add("* [component 2](http://link.here) - x.y.z")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$Author, {
    hide("Author")
    Add("### :blush: Authors")
    nextLine()
    Add("* :octocat: User1 [@github](http://github.link)")
    nextLine()
    Add("* :octocat: User2 [@github](http://github.link)")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$License, {
    hide("License")
    Add("### :memo: License")
    nextLine()
    Add("Copyright :copyright: 2019 Jinhwan Kim")
    nextLine()
    Add("This project is [MIT](https://opensource.org/licenses/MIT) licensed")
    nextLine()
    nextLine()
    Add("*This README was generated with :two_hearts: by [shinyReadme](http://github.com/jhk0530/shinyReadme)*")
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$shinyapps, {
    hide('shinyapps')
    Add('### :cloud: ShinyApps')
    nextLine()
    Add('https://jhkim.shinyapps.io/shinyReadme/')
    nextLine()
    nextLine()
    Focus()
  })

  observeEvent(input$h1, {
    Add('# large header')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$h2, {
    Add('## medium header')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$h3, {
    Add('### small header')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$bl, {
    Add('* item')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$hr, {
    Add('<hr>')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$link, {
    Add('[title](http://link.here)')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$table, {
    Add('|AAAAAA|BBBBBB|CCCCCCC|')
    nextLine()
    Add('|---:|:---:|:---|')
    nextLine()
    Add('|right|center|left|')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$image, {
    Add('<img src ="https://user-images.githubusercontent.com/6457691/71307309-d000d600-242f-11ea-9ab9-32bf32ac57d8.png" width = 300> </img>')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$code, {
    Add('``` R')
    nextLine()
    Add('cat("Hello, world")')
    nextLine()
    Add('```')
    nextLine();nextLine();Focus()
  })

  observeEvent(input$ricon,{
    Add(paste0(':',sample(icons,1), ':') )
    nextLine();nextLine();Focus()
  })

  observeEvent(input$Download, {
    shinyjs::js$download()
  })
}
shinyApp(ui, server)
