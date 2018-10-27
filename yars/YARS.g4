/*
 [The "BSD licence"]
 Copyright (c) 2018, Łukasz Szeremeta (@ University of Bialystok, http://www.uwb.edu.pl/)
 Copyright (c) 2018, Dominik Tomaszuk (@ University of Bialystok, http://www.uwb.edu.pl/)
 All rights reserved.

 Some parts of grammar from Turtle grammar
 (https://github.com/antlr/grammars-v4/blob/master/turtle/TURTLE.g4)
 by Alejandro Medrano (@ Universidad Politecnica de Madrid, http://www.upm.es/)
 distributed under BSD licence.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
*/

grammar YARS;

yars
    : (statement NL+) +
    ;

statement
    : directive
    | declaration
    ;

directive
    : prefixDirective
    ;

declaration
    : vertexDeclaration
    //| relationshipDeclaration
    ;

prefixDirective
    : PNAME_NS CONTEXT
    ;

PNAME_NS
    : ':' ALNUM_PLUS ':'
    ;

vertexDeclaration
    : '(' VERTEX_NAME '{' pair (',' pair)* '}' ')'
    ;

VERTEX_NAME
    : ALNUM_PLUS
    ;

pair
    : pair_name ':' pair_value
    ;

pair_name
    : 'value'
    | 'lang'
    | 'datatype'
    | ALNUM_PLUS
    ;

pair_value
    : CONTEXT
    | ALNUM_PLUS
    ;

/* FROM TURTLE ANTLR GRAMMAR */

ALNUM_PLUS
    : PN_CHARS_BASE ((PN_CHARS | '.')* PN_CHARS)?
    ;

CONTEXT
    : '<' (PN_CHARS | '.' | ':' | '/' | '\\' | '#' | '@' | '%' | '&' | UCHAR)* '>'
    ;

PN_CHARS
    : PN_CHARS_U | '-' | [0-9] | '\u00B7' | [\u0300-\u036F] | [\u203F-\u2040]
    ;

PN_CHARS_U
    : PN_CHARS_BASE | '_'
    ;

UCHAR
    : '\\u' HEX HEX HEX HEX | '\\U' HEX HEX HEX HEX HEX HEX HEX HEX
    ;

PN_CHARS_BASE
    : 'A' .. 'Z' | 'a' .. 'z' | '\u00C0' .. '\u00D6' | '\u00D8' .. '\u00F6' | '\u00F8' .. '\u02FF' | '\u0370' .. '\u037D' | '\u037F' .. '\u1FFF' | '\u200C' .. '\u200D' | '\u2070' .. '\u218F' | '\u2C00' .. '\u2FEF' | '\u3001' .. '\uD7FF' | '\uF900' .. '\uFDCF' | '\uFDF0' .. '\uFFFD'
    ;

HEX
    : [0-9] | [A-F] | [a-f]
    ;

/* FROM TURTLE ANTLR GRAMMAR */

SP
    : (' ' | [\t] )+ -> skip
    ;

NL
    : [\r\n]
    ;

