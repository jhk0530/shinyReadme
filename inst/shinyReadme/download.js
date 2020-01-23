shinyjs.download = function(){
    var text = document.getElementById("text").value;
    text = text.replace(/\n/g, "\r\n");
    var blob = new Blob([text], { type: "text/plain"});
    var anchor = document.createElement("a");
    anchor.download = "README.md"; 
    anchor.href = window.URL.createObjectURL(blob);
    anchor.target ="_blank";
    anchor.style.display = "none";
    document.body.appendChild(anchor);
    anchor.click();
    document.body.removeChild(anchor);
 }
 
shinyjs.insertAtCursor = function(txt) {
	var myField = document.getElementById("text");

    if (myField.selectionStart || myField.selectionStart == '0') {
        var startPos = myField.selectionStart;
        var endPos = myField.selectionEnd;
        myField.value = myField.value.substring(0, startPos)
            + txt
            + myField.value.substring(endPos, myField.value.length);
    } else {
        myField.value += txt;
    }
}
