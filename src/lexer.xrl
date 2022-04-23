Definitions.

%New Line
Newline = [\{\n}|\{\r}]

%Keywords
Keywords = (False|None|True|and|as|assert|async|await|break|class|continue|def|del|elif|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield|print|input)

%Letras y digitos
D = [0-9]
L = [a-z|A-Z]

%Id
Id = [a-z|A-Z][0-9|a-z|A-Z]*


%String literals
%Stringescapeseq = (\\.)
%Longstringchar = [^\]
%Shortstringchar = [^\|.]
%Stringprefix = [r|u|R|U|f|F|fr|Fr|fR|FR|rf|rF|Rf|RF]
%Longstringitem = [Longstringchar|Stringescapeseq]
%%Shortstringseq = [Shortstringchar|Stringescapeseq]
%Longstring = ["'''"Longstringitem*"'''"|'"""Longstringitem*'"""']
%Shortstring = ["'"Shortstringitem*"'"|'"'Shortstringitem*'"']
%Stringliteral = [stringprefix[shortstring|longstring]]

%string literals
Shortstringchar= [^"\""\\"'"]
Longstringchar = [^\\]
Stringescapeseq = (\\.)
Stringprefix = [r|u|R|U|f|F|fr|Fr|fR|FR|rf|rF|Rf|RF]
Longstringitem = {Longstringchar}|{Stringescapeseq}
Shortstringitem = ({Shortstringchar}|{Stringescapeseq})
Longstring = '''({Longstringitem})'''|"""({Longstringitem})"""
Shortstring= '({Shortstringitem})'|"({Shortstringitem})"
Stringliteral = ({Stringprefix})?({Longstring}|{Shortstring})

%Byte literals
Bytesprefix= [b|B|br|Br|bR|BR|rb|rB|Rb|RB]
Bytesliteral = (({Bytesprefix}({Shortstring}|{Longstring}))

%Bytes literals
Bytesescapeseq = [\\.]
Longbyteschar = [^\]
Shortbyteschar = [^\|.]
Bytesprefix = [b|B|br|Br|bR|BR|rb|rB|Rb|RB]
Longbytesitem = [Longbyteschar|Bytesescapeseq]
Shortbytesitem = [Shortbyteschar|Bytesescapeseq]
%Longbytes =  ["'''"Longbytesitem*"'''"|'"""'Longbytesitem*'"""']
%Shortbytes = ["'"Shortbytesitem*"'"|'"'Shortbytesitem*'"']
%Bytesliteral = [Bytesprefix[Shortbytes|Longbytes]

%Integer literals
Nonzerodigit = [1-9]
Digit = [{D}]
Bindigit = [0|1]
Octdigit = [0-7]
Hexdigit = [Digit|a-f|A-F]
Bininteger = [0(b|B)([\_]Bindigit)]
Octinteger = [0(o|O)([\_]Octdigit)]
Hexinteger = [0(x|X)([\_]Hexdigit)]
Decinteger = [Nonzerodigit([\_]digit)*|(\0[\_]\0)]
Integer = [{Decinteger}|{Bininteger}|{Octinteger}|{Hexinteger}]

%Floating point literals
Digitpart = [{Digit}([\_]{Digit})*]
Fraction = [\.{Digitpart}]
Pointfloat = [{Digitpart}{{Fraction}|{Digitpart}}\.]
Exponent = [(e|E)[\+|\-]{Digitpart}]
Exponentfloat = [{{Digitpart}|{Pointfloat}}{Exponent}]
Floatnumber = [{{Pointfloat}|{Exponentfloat}}]

%Imaginary literals
Imagnumber = [{{Floatnumber}|{Digitpart}}(j|J)]

%Delimiters
Delimiters = [\(|\)|\[|\]|\{|\}|\,|\:|\.|\;|\@|\=|\->|\+=|\-=|\=|\/=|\//=|\%=|\@=|\&=|\|=|\^=|\>>=|\<<=|\*=]

%Operadores 
O = [+||*|/|\//|@|\<<|>>|&|^|~|\:=|<|>|<=|>=|==|!=|\-|\%|\|\|]
% falta | 


Rules.
\s                    : skip_token.

{Newline}             : {token, {newline, TokenLine, TokenChars}}.

{O}                   : {token, {op, TokenLine, TokenChars}}.


(\#.*)                : {token, {comment, TokenLine, TokenChars}}.
%(\""").*(\""")       : {token, {comment, TokenLine, TokenChars}}.

\"[^"]*\"             : {token, {string, TokenLine, TokenChars}}.


aa*b                  : {token, {la, TokenLine, TokenChars}}.
ba                    : {token, {lb, TokenLine, TokenChars}}.
{Id}                  : {token, {id, TokenLine, TokenChars}}.

{D}{D}*               : {token, {int, TokenLine, TokenChars}}.
{D}+                  : {token, {int, TokenLine, TokenChars}}.

{Keywords}            : {token, {keywords, TokenLine, TokenChars}}.

{D}\.{D}            : {token, {float, TokenLine, TokenChars}}.
{D}*e{D}+             : {token, {float, TokenLine, TokenChars}}.
%{D}([\_]{D})*        : {token, {float, TokenLine, TokenChars}}.
({D}+\.{D}+e{D}+)     : {token, {float, TokenLine, TokenChars}}.
({D}+\.{D}+e\-{D}+)   : {token, {float, TokenLine, TokenChars}}.
{Floatnumber}         : {token, {float, TokenLine, TokenChars}}.

%{L}{_|{L}|{D}}*      : {token, {identifier, TokenLine, TokenChars}}.

{Stringliteral}       : {token, {string, TokenLine, TokenChars}}.

{Imagnumber}          : {token, {imagnumber, TokenLine, TokenChars}}.
{Delimiters}          : {token, {delimiters, TokenLine, TokenChars}}.


Erlang code.