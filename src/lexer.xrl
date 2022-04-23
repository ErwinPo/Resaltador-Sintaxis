Definitions.


%Keywords
Keywords = (False|None|True|and|as|assert|async|await|break|class|continue|def|del|elif|if|import|in|is|lambda|nonlocal|not|or|pass|raise|return|try|while|with|yield|print|input)

%Letras y digitos
D = [0-9]
L = [a-zA-Z]

%Id
Id = [a-zA-Z][0-9a-zA-Z_]*


Rules.
\s                    : {token, {space, TokenLine, TokenChars}}.

\n|\r             : {token, {newline, TokenLine, TokenChars}}.

\+|\*|/|//|[@&~<>]|(<<)|(>>)|\^|(:=)|<|>|(<=)|(>=)|(==)|!=|\-|%    : {token, {op, TokenLine, TokenChars}}.

(\#.*)                : {token, {comment, TokenLine, TokenChars}}.
%(\""").*(\""")       : {token, {comment, TokenLine, TokenChars}}.

{Id}                  : {token, {id, TokenLine, TokenChars}}.

{D}(\_?{D})*                    : {token, {int, TokenLine, TokenChars}}.
0(b|B)(\_?[01])*          : {token, {int, TokenLine, TokenChars}}.
0(o|O)(\_?[1-7])*          : {token, {int, TokenLine, TokenChars}}.
0(x|X)(\_?[0-9a-fA-F])*    : {token, {int, TokenLine, TokenChars}}.

{Keywords}            : {token, {keywords, TokenLine, TokenChars}}.

{D}(\_?{D})*\.(({D}(\_?{D})*)?(e(\-|\+)?{D}(\_?{D})*)?)?  : {token, {float, TokenLine, TokenChars}}.
\.({D}(\_?{D})*)(e(\-|\+)?{D}(\_?{D})*)?  : {token, {float, TokenLine, TokenChars}}.
{D}(\_?{D})*\.?(({D}(\_?{D})*)?(e(\-|\+)?{D}(\_?{D})*)?)  : {token, {float, TokenLine, TokenChars}}.


{D}(\_?{D})*\.(({D}(\_?{D})*)?(e(\-|\+)?{D}(\_?{D})*)?)?j|J  : {token, {imagnumber, TokenLine, TokenChars}}.
\.({D}(\_?{D})*)(e(\-|\+)?{D}(\_?{D})*)?j|J  : {token, {imagnumber, TokenLine, TokenChars}}.
{D}(\_?{D})*\.?(({D}(\_?{D})*)?(e(\-|\+)?{D}(\_?{D})*)?)j|J  : {token, {imagnumber, TokenLine, TokenChars}}.


\[|\]|[,:;@=(){}]|(->)|(\+=)|(\-=)|(/=)|(//=)|(%=)|(@=)|(&=)|\\|(\^=)|(>>=)|(<<=)|(\*=) : {token, {delimiters, TokenLine, TokenChars}}.
\. : {token, {delimiters, TokenLine, TokenChars}}.
\"[^"]*\"             : {token, {string, TokenLine, TokenChars}}.

Erlang code.