## Grammar

```
Statement -> Definition | Expression  
Definition -> VaribleDefinition | FunctionDefinition
VariableDefinition -> Identifier '=' Expression
FunctionDefinition -> Identifier '(' (Identifier (',' Identifier)* )? ')' '=' Expression
Expression -> Term
Term -> Product (('+'|'-') Product)*
Product -> PrefixUnary (('×'|'/') PrefixUnary)*
PostfixUnary -> PrefixUnary ('°' | '!')?
PrefixUnary -> ('-' PrefixUnary) | Call
Call -> Primary ('(' (Expression (',' Expression)*)? ')')?
Primary -> Number | Identifier | '(' Expression ')'
```
