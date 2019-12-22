library(shinyjs)

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
  shinyjs::js$insertAtCursor(text)
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
