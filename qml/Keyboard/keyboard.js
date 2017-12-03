//Handle keypads
function handleOpCode(op) {
    if (op.toString().length === 1) {
        if (curText.text.toString().length < 80)
            curText.text = curText.text + op.toString();
    }
    else if (op === "Enter") {
        keybMainWindow.textEntered(curText.text);
    }
    else if (op === "Del")
         curText.text = curText.text.toString().slice(0, -1);
    else if (op === "Space") {
        if (curText.text.toString().length < 80)
           curText.text = curText.text + " ";
    } else if (op === "Clear")
        curText.text = "";
    else if (op === "Go") {
        keybMainWindow.enterWebView(curText.text);
    }
}



