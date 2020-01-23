if(!require("shiny")) install.packages('shiny')
if(!require("markdown")) install.packages('markdown')
if(!require("devtools")) install.packages('devtools')
if(!require("semantic.dashboard")) install.packages('semantic.dashboard')
if(!require("shiny.semantic")) install.packages('shiny.semantic')
if(!require("shinyjs")) install.packages('shinyjs')

library(shiny)
library(markdown)
library(semantic.dashboard)
library(shiny.semantic)
library(shinyjs)
library(V8)

source("icons.R")
source("ui.R")
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
  })

  observeEvent(input$Description, {
    hide("Description")
    Add("One Paragraph of project description goes here")
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
  })


  observeEvent(input$Dependency, {
    hide("Dependency")
    Add("### :paperclip: Dependency")
    nextLine()
    Add("* [component 1](http://link.here) - x.y.z")
    nextLine()
    Add("* [component 2](http://link.here) - x.y.z")
  })

  observeEvent(input$Prerequisites, {
    hide("Prerequisites")
    Add("### :clipboard: Prerequisites")
    nextLine()
    Add("* [component 1](http://link.here) - x.y.z")
    nextLine()
    Add("* [component 2](http://link.here) - x.y.z")
  })

  observeEvent(input$Author, {
    hide("Author")
    Add("### :blush: Authors")
    nextLine()
    Add("* :octocat: User1 [@github](http://github.link)")
    nextLine()
    Add("* :octocat: User2 [@github](http://github.link)")
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
  })

  observeEvent(input$shinyapps, {
    hide("shinyapps")
    Add("### :cloud: ShinyApps")
    nextLine()
    Add("https://jhkim.shinyapps.io/shinyReadme/")
  })

  observeEvent(input$h1, {
    Add("# large header")
  })

  observeEvent(input$h2, {
    Add("## medium header")
  })

  observeEvent(input$h3, {
    Add("### small header")
  })

  observeEvent(input$bl, {
    Add("* item")
  })

  observeEvent(input$hr, {
    Add("<hr>")
  })

  observeEvent(input$link, {
    Add("[title](http://link.here)")
  })

  observeEvent(input$table, {
    Add("|AAAAAA|BBBBBB|CCCCCCC|")
    nextLine()
    Add("|---:|:---:|:---|")
    nextLine()
    Add("|right|center|left|")
  })

  observeEvent(input$image, {
    Add(myimg)
  })

  observeEvent(input$code, {
    Add("``` R")
    nextLine()
    Add('cat("Hello, world")')
    nextLine()
    Add("```")
  })

  observeEvent(input$ricon, {
    Add(paste0(":", sample(icons, 1), ":"))
  })

  observeEvent(input$Download, {
    shinyjs::js$download()
  })
}
shinyApp(ui, server)
