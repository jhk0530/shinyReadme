library(shiny)
library(markdown)
library(semantic.dashboard)
library(shiny.semantic)
library(shinyjs)
library(V8)

myDashboardHeader <- function() {
  dashboardHeader(
    color = "blue",
    inverted = TRUE,
    actionButton(
      inputId = "link",
      label = "Github",
      icon = uiicon(type = "github"),
      class = "Autobuild"
    )
  )
}
myDashboardSidebar <- function() {
  dashboardSidebar(
    color = "blue",
    size = "",
    inverted = TRUE,
    sidebarMenu(
      actionButton(
        inputId = "Title", label = "Title",
        icon = icon(type = "clipboard outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Description", label = "Description",
        icon = icon(type = "pencil alternate"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Prerequisites", label = "Prerequisites",
        icon = icon(type = "terminal"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Install", label = "Install",
        icon = icon(type = "cog"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Dependency", label = "Dependency",
        icon = icon(type = "book"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Author", label = "Author",
        icon = icon(type = "user outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "GetStart", label = "GetStart",
        icon = icon(type = "play"), class = "Autobuild"
      ),

      actionButton(
        inputId = "API", label = "API",
        icon = icon(type = "sticky note outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "shinyapps", label = "shinyapps",
        icon = icon(type = "cloud"), class = "Autobuild"
      ),

      actionButton(
        inputId = "License", label = "License",
        icon = icon(type = "file alternate outline"), class = "Autobuild"
      )
    )
  )
}
myDashboardBody <- function() {
  dashboardBody(
    style = "width:100% !important",
    tags$head(
      tags$style(HTML(".downloadButton:hover {background-color: #94cf96 !important;}")),
      tags$style(HTML(".Autobuild:hover {background-color: #328fd4 !important;}")),
      tags$style(HTML(".downloadButton {
                      font-size:1.5em;
                      float:right;
                      background-color : #44bd32;
                      color : white;
                      font-weight: 1000;
                      padding :0.5em;}")),
      tags$style(HTML("#toggle_menu {font-size : 1.5em;}")),
      tags$style(HTML(".Autobuild {
                      background-color: #2185D0 !important;
                      border-bottom:0.1px solid #217abf;
                      text-align:left;
                      color:white;
                      width:100%;
                      padding : 0.5em;
                      font-size : 1.5em;
                      cursor:pointer;
                      border-top:none;
                      border-right:none;border-left:none;
                      }"))
    ),
    useShinyjs(),
    extendShinyjs(script = "download.js"),
    fluidRow(
      semantic.dashboard::column(
        width = 8,
        tags$textarea(
          id = "text",
          cols = 30,
          rows = 20,
          style = "width : 100%; font-size :1.5em; resize :none;"
        ),
        p("Press Enter to load text completely",
          style = "font-weight: bold;
                font-size: 1.5em;
                float: left;"
        ),
        actionButton(
          inputId = "Download",
          label = "Download",
          icon = icon(type = "save outline"),
          class = "downloadButton"
        )
      ),
      semantic.dashboard::column(
        width = 8,
        uiOutput(outputId = "markdown")
      )
    )
  )
}
ui <- dashboardPage(
  title = "ShinyReadme",
  header = myDashboardHeader(),
  sidebar = myDashboardSidebar(),
  body = myDashboardBody()
)

addinTextArea <- function(txt) {
  txt <- gsub("\n", "<br>", txt)
  txt <- paste0("document.getElementById('text').value += '", txt, "'")
  return(txt)
}

nextLine <- function() {
  shinyjs::runjs("document.getElementById('text').value += '\\n'")
}

hide <- function(btn) {
  shinyjs::runjs(paste0('$("#', btn, '").hide(500)'))
}

Add <- function(text) {
  shinyjs::runjs(addinTextArea(text))
}

Focus <- function() {
  shinyjs::runjs('$("#text").focus()')
}

CodeArea <- function(txt) {
  Add("```r")
  nextLine()
  Add(txt)
  nextLine()
  Add("```")
}

server <- function(input, output, session) {
  output$markdown <- renderUI({
    HTML(markdownToHTML(text = input$text, stylesheet = "", header = ""))
  })

  observeEvent(input$link, {
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

  observeEvent(input$Download, {
    shinyjs::js$download()
  })
}
shinyApp(ui, server)
