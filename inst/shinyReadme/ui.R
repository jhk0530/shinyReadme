
myDashboardHeader <- function() {
  dashboardHeader(
    color = "blue",
    inverted = TRUE,
    actionButton(
      inputId = "Githublink",
      label = "Github",
      icon = icon(type = "github"),
      class = "Autobuild"
    )
  )
}

myDashboardSidebar <- function() {
  dashboardSidebar(
    color = "blue",
    size = "thin",
    inverted = TRUE,
    sidebarMenu(
      actionButton(
        inputId = "noId", label = "SINGLE USE", class = "Blocks"
      ),

      actionButton(
        inputId = "Title", label = "Title",
        icon = icon(type = "clipboard outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "Badge", label = "Badge",
        icon = icon(type = "ticket alternate"), class = "Autobuild"
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
        inputId = "shinyapps", label = "shinyapps",
        icon = icon(type = "cloud"), class = "Autobuild"
      ),

      actionButton(
        inputId = "License", label = "License",
        icon = icon(type = "file alternate outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "noId2", label = "BASIC BLOCKS", class = "Blocks"
      ),

      actionButton(
        inputId = "h1", label = "Header (L)", icon = icon(type = "heading"), class = "Autobuild"
      ),

      actionButton(
        inputId = "h2", label = "Header (M)", icon = icon(type = "heading", style = "font-size:0.8em;"), class = "Autobuild"
      ),

      actionButton(
        inputId = "h3", label = "Header (S)", icon = icon(type = "heading", style = "font-size:0.6em;"), class = "Autobuild"
      ),

      actionButton(
        inputId = "bl", label = "Bulleted List", icon = icon(type = "list ul"), class = "Autobuild"
      ),

      actionButton(
        inputId = "hr", label = "Divider", icon = icon(type = "window minimize outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "link", label = "Link", icon = icon(type = "linkify"), class = "Autobuild"
      ),

      actionButton(
        inputId = "table", label = "Table", icon = icon(type = "table"), class = "Autobuild"
      ),

      actionButton(
        inputId = "image", label = "Image", icon = icon(type = "file image outline"), class = "Autobuild"
      ),

      actionButton(
        inputId = "code", label = "Code", icon = icon(type = "file code"), class = "Autobuild"
      ),

      actionButton(
        inputId = "ricon", label = "Random icon", icon = icon(type = "heart"), class = "Autobuild"
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
                      font-size:1em;
                      float:right;
                      background-color : #44bd32;
                      color : white;
                      font-weight: 1000;
                      padding :0.5em;}")),
      tags$style(HTML("#toggle_menu {font-size : 1em; background-color:#00cec9;}")),
      tags$style(HTML(".Blocks {
                      color: white;
                      width: 100%;
                      padding: 0.5em;
                      font-size: 1.2em;
                      background-color: #00cec9;
                      border: solid 0px white;
                      }")),
      tags$style(HTML(".Autobuild {
                      background-color: #2185D0 !important;
                      border-bottom:0.1px solid #217abf;
                      text-align:left;
                      color:white;
                      width:100%;
                      padding : 0.5em;
                      font-size : 1em;
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
          style = "width : 100%; font-size :1em; resize :none;"
        ),
        p("Press Enter to load text completely",
          style = "font-weight: bold;
                font-size: 1em;
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
