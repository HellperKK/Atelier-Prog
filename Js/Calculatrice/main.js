(() => {
    const body = document.body

    const evalButton = document.createElement("button")
    evalButton.innerText = "eval"
    body.appendChild(evalButton)

    body.appendChild(document.createElement("br"))

    const inputArea = document.createElement("textarea")
    inputArea.cols = 90
    inputArea.rows = 40
    inputArea.placeholder = "your code here..."
    body.appendChild(inputArea)

    const outputArea = document.createElement("textarea")
    outputArea.cols = 90
    outputArea.rows = 40
    outputArea.placeholder = "your result here..."
    body.appendChild(outputArea)

    evalButton.addEventListener("click", () => {
        const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar))

        try {
            const trees = parser.feed(inputArea.value)
            const results = trees.results

            if (results.length == 0) {
                throw new Error("no result")

            }
            
            outputArea.value = results[0]
        } catch (error) {
            outputArea.value = error
        }
    })
})()