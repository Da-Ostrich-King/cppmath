# So you want to contribute
Be sure to read the following before submitting PR's.

Don't expect the PR to be accepted or even read, I may abandon this in the future and if I do, feel free to fork it.

## Styling
### Angle Brackets
Keep angle brackets on the same line.
```
void foo() {
    /* implementation */
}
```
### Encapsulating punctuation
Function, template, and other arguments will look like the following with spaces in between the arguments and the encapsulating puncuation.
```
foo( arg1, arg2, arg3 );
std::vector< std::pair< int, char > >;
```
### Comments
Comments, multiline comments are expressed using /**/ and single line comments are //
```
// single line comment
/*
* multiline comment
* omg another line
* a THIRD line
*/
```
### if Statements or Loops
Do not leave out the {} when doing single statement if statements or loops
```
// this
if ( condition ) {
    statement();
}
// not this
if ( condition )
    statement();

// this is ok for simple statements like i++, not return statements
if ( condition ) statement();
```
### Turnary Operators
Simple, surround each aspect in parenthesise
```
return ( condition ) ? ( statement1 ) : ( statement2 );
```
### Long statements
When putting a newline in long function calls, do it before the first argument, or at even-ish intervals. Put the newline 1 tab indented from the parent function call.
```
// this is an example from this codebase at some point in time
            throw core::Exception( "Redundant Flag", std::format( 
                "Redundant flag {} was registered. Exists in option[{}]",
                expanded, i ) );
```
### Long string literals
Separate long literals buy newlines at equal indentation
```
const char* longLiteral = "This is a very long string literal\n"
                            "String literals don't necessaraly have to"
                            " have a newline in the literal at the same"
                            " point at which it is being broken apart."
                            " If the literal needs a space at the break point,"
                            " put it on the next line, if it needs a newline\n"
                            "It goes on the current line"
```
### Symbol names and declaration
Variables should be declared on their own line, and if applicable initialized on the same line
```
// variable names should be camelCase
int fooBar;
// class names should be PascalCase, and ideally one word
class Exception {}
```
Constants should be SCREAMING_SNAKE_CASE with some [notable exceptions](#symbol-names-exceptions)
```
const float PI = 3.14159;
```
Pointers
```
// pointers go with the type
int* integerPointer;
// pointers should be written to be read right to left, which makes and easy rule to remember when trying to understand complex pointer types
char const** pRealCommandUnsafe = new char const *[ 4 ];
```


### Exceptions to style rules

#### Symbol names exceptions

Symbol names for the most part will follow the rules I have outlined above. But there are exceptions.
- When writing well know mathematical constants like e, they should be written like this `const float e = 2.71828;`
- When writing constants that are disposable, for example `const char* filePath = "path/to/file";` (although it really should be std::filesystem::path("path/to/file") and then acquire the c_string when needed)
- But not exempting universal constants like
```
const char* HELP_TEXT = 
    "HEEEEEEEEEEEEEEEEELP\n"
    "IM TRAAAAAAAAAAAAAAAAPED\n";
```