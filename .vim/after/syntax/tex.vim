"TeX specific syntax definitions, mainly for conceal
syn match texMathSymbol '\\half\>' contained conceal cchar=½
syn match texMathSymbol '\\left(' contained conceal cchar=(
syn match texMathSymbol '\\right)' contained conceal cchar=)
syn match texMathSymbol '\\left\[' contained conceal cchar=[
syn match texMathSymbol '\\right\]' contained conceal cchar=]
syn match texMathSymbol '\\dagger' contained conceal cchar=†
syn match texMathSymbol '\\text' contained conceal
syn match texMathSymbol '\\!' contained conceal
syn match texMathSymbol '\\,' contained conceal
syn match texMathSymbol '\\;' contained conceal
syn match texMathSymbol '\\quad' contained conceal cchar= 
syn match texMathSymbol '\\qquad' contained conceal cchar= 
syn match texMathSymbol '\\frac{1}{2}' contained conceal cchar=½
