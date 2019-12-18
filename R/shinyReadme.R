shinyReadme <- function() {
  appDir <- system.file("shinyReadme", package = "shinyReadme")
  if (appDir == "") {
    stop(
      "Could not find Directory, Try re-install",
      call. = FALSE
    )
  }

  shiny::runApp(
    appDir,
    launch.browser = TRUE,
    display.mode = "normal"
  )
}
