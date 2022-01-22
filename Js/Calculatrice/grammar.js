// Generated automatically by nearley, version 2.20.1
// http://github.com/Hardmath123/nearley
(function () {
function id(x) { return x[0]; }

const funs = {
        factorial: x => {
                let acc = 1

                for (let i = 1; i <= x; i++) {
                        acc *= i
                }

                return acc
        },

        random: Math.random,
        abs: Math.abs,
        ceil: Math.abs,
        floor: Math.abs,
        round: Math.abs,
        sqrt: Math.abs,
        pow: Math.abs,
        log: Math.abs,
        log10: Math.abs,
        randomRange: (min, max) => min + (Math.random() * (max - min))
}

const callFun = (name, args) => {
        if (!funs[name]) {
                throw `function ${name} does not exist`
        }

        return funs[name](...args)
}

const lexer = moo.compile({
  // symbols
  plus: "+",
  minus: "-",
  power: "**",
  times: "*",
  divide: "/",
  modulo: "%",
  comma: ",",

  // tokens
  decimal: /\d+(?:\.\d+)?/,
  ident: /[A-Za-z]+/,

  // group symbols
  openPar: /\(/,
  closePar: /\)/,

  // spaces
  ws: {match: /\s+/, lineBreaks: true}
});

const unit = {type: "unit", content: null}
var grammar = {
    Lexer: lexer,
    ParserRules: [
    {"name": "main", "symbols": ["adsub"]},
    {"name": "adsub", "symbols": ["addition"], "postprocess": id},
    {"name": "adsub", "symbols": ["division"], "postprocess": id},
    {"name": "block", "symbols": [(lexer.has("openCur") ? {type: "openCur"} : openCur), "_", "main", "adsub", "_", (lexer.has("closeCur") ? {type: "closeCur"} : closeCur)], "postprocess": arr => ({type: "block", content: arr[2], returning: arr[3]})},
    {"name": "block", "symbols": [(lexer.has("openCur") ? {type: "openCur"} : openCur), "_", "main", "_", (lexer.has("closeCur") ? {type: "closeCur"} : closeCur)], "postprocess": arr => ({type: "block", content: arr[2], returning: unit})},
    {"name": "addition", "symbols": ["adsub", "_", (lexer.has("plus") ? {type: "plus"} : plus), "_", "muldiv"], "postprocess": arr => arr[0] + arr[4]},
    {"name": "addition", "symbols": ["muldiv"], "postprocess": id},
    {"name": "substraction", "symbols": ["adsub", "_", (lexer.has("minus") ? {type: "minus"} : minus), "_", "muldiv"], "postprocess": arr => arr[0] - arr[4]},
    {"name": "substraction", "symbols": ["muldiv"], "postprocess": id},
    {"name": "muldiv", "symbols": ["multiplication"], "postprocess": id},
    {"name": "muldiv", "symbols": ["division"], "postprocess": id},
    {"name": "multiplication", "symbols": ["muldiv", "_", (lexer.has("times") ? {type: "times"} : times), "_", "exponen"], "postprocess": arr => arr[0] * arr[4]},
    {"name": "multiplication", "symbols": ["exponen"], "postprocess": id},
    {"name": "division", "symbols": ["muldiv", "_", (lexer.has("divide") ? {type: "divide"} : divide), "_", "exponen"], "postprocess": arr => arr[0] / arr[4]},
    {"name": "division", "symbols": ["exponen"], "postprocess": id},
    {"name": "exponen", "symbols": ["funpar", "_", (lexer.has("power") ? {type: "power"} : power), "_", "exponen"], "postprocess": arr => arr[0] ** arr[4]},
    {"name": "exponen", "symbols": ["funcall"], "postprocess": id},
    {"name": "exponen", "symbols": ["parens"], "postprocess": id},
    {"name": "funpar", "symbols": ["funcall"], "postprocess": id},
    {"name": "funpar", "symbols": ["parens"], "postprocess": id},
    {"name": "funcall", "symbols": [(lexer.has("ident") ? {type: "ident"} : ident), (lexer.has("openPar") ? {type: "openPar"} : openPar), "_", "argslist", "_", (lexer.has("closePar") ? {type: "closePar"} : closePar)], "postprocess": arr => callFun(arr[0], arr[3])},
    {"name": "argslist", "symbols": ["argslist", "_", (lexer.has("comma") ? {type: "comma"} : comma), "_", "adsub"], "postprocess": arr => arr[0].concat(arr[4])},
    {"name": "argslist", "symbols": ["adsub"]},
    {"name": "argslist", "symbols": [], "postprocess": arr => []},
    {"name": "parens", "symbols": [(lexer.has("openPar") ? {type: "openPar"} : openPar), "_", "adsub", "_", (lexer.has("closePar") ? {type: "closePar"} : closePar)], "postprocess": arr => arr[2]},
    {"name": "parens", "symbols": ["decimal"], "postprocess": id},
    {"name": "decimal", "symbols": [(lexer.has("decimal") ? {type: "decimal"} : decimal)], "postprocess": arr => parseFloat(arr[0])},
    {"name": "_$ebnf$1", "symbols": [(lexer.has("ws") ? {type: "ws"} : ws)], "postprocess": id},
    {"name": "_$ebnf$1", "symbols": [], "postprocess": function(d) {return null;}},
    {"name": "_", "symbols": ["_$ebnf$1"], "postprocess": function(arr) { return null; }},
    {"name": "__", "symbols": [(lexer.has("ws") ? {type: "ws"} : ws)], "postprocess": function(arr) { return null; }}
]
  , ParserStart: "main"
}
if (typeof module !== 'undefined'&& typeof module.exports !== 'undefined') {
   module.exports = grammar;
} else {
   window.grammar = grammar;
}
})();
