package org.intellij.sdk.language;

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.TokenType;
import com.intellij.lexer.FlexLexer;
import org.intellij.sdk.language.psi.UssTypes;


%%

%class UssLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

L_PARENTHESIS="("
R_PARENTHESIS=")"
DOUBLE_QUOTE = ["\""]
SEPARATOR=[\s]+
WORD=[\w]+|[$]+|["'"]|[";"]|[","]|["?"]|["+"]|["-"]|["."]|[":"] | ["*"] | ["{"] | ["}"] | [">"] | ["<"] | ["="] | ["!"] | ["%"] | ["\/"] | ["&"]
EMPTY_TOKEN = ["("][\s]*[")"]




CRLF=\r|\n|\r\n
COMMENT_EXPR = [#][^\r\n]+

// IDENTIFIERS
BLOCK = "block"
ELEMENT = "element"
CSS = "css"
BINDING = "bind"
IMPORT = "import"
CLASS = "class"
STYLE = "style"

ELEMENT_NAME = [\w]+
BINDING_NAME = "controller"|"child"|"childParentScope"|"instance"|"event"|"dispatch"|"dispatchDelayReset"|"style"|"class"|"sync"|"repeat"|"repeatCache"|"repeatObject"|"dataRefDH"|"watchDH"|"entityDH"|"firstEntityDH"|"handleEventDH"|"fxInstance"|"mrMeeseeks"|"collectionDH"|"collectionDHById"|"collectionRepeatDH"|"collectionDesign"|"collectionFields"|"primaryEntityDH"|"clikList"|"draggableWindow"|"draggable"|"droppable"|"resize"|"appear"|"fade"|"transition"|"timestampTween"|"textCountdown"|"pluralText"|"tooltip"|"popup"|"popupNoCache"|"menu"|"blurLayer"|"blurMap"|"input"|"request"|"action"|"focus"|"sequence"|"feature"|"catch"|"catchProperty"|"var"|"watch"|"actionIsDisplay"|"scopeHoldRepeat"|"stageSize"|"clickSplit"|"substitute"|"scopeTrace"|"changeDispatch"|"countdown"|"file"|"imeEnable"|"linearChart"|"eventSequence"|"contains"|"levelToFeature"|"timeFormat"|"serverTime"|"generator"|"generatorDH"|"clock"|"inoutAction"|"soundOn"|"vTileHack"|"blockSize"|"stageCoord"|"scrollController"|"scrollControllerCentered"|"catchDH"|"keyboard"|"debugWrite"|"debugRead"|"debugReadAll"|"debugSend"|"debugReceive"|"debugRewrite"|"debugTypeOf"|"debugScope"|"debugDataProvider"|"debugBlockInfo"|"debugScopeDraw"|"concat"|"colorTransform"|"clipboard"|"resource"|"slice"|"mc"|"objectUnderPoint"|"restrictFeedback"|"perFrameUpdate"|"indexOf"|"atlasText"|"timeline"|"battleHint"|"lag"|"dragCursor"|"makeScreenshot"|"directEvent"|"visible"
BINDING_PROP = [\w]+
//BINDING_NAME = [\w]+

//WHITE_SPACE=[\ \n\t\f]
//COMMENT=("//")[^\r\n]*
//FIRST_VALUE_CHARACTER=[(]//[^ \n\f\\] | "\\"{CRLF} | "\\".
//VALUE_CHARACTER=[^\n\f\\] | "\\"{CRLF} | "\\".
//END_OF_LINE_COMMENT=("#"|"!")[^\r\n]*




%state ELEMENT_DEFINITION
%state BINDING_DEFINITION
%state BINDING_PARAMS


%%



<YYINITIAL> {COMMENT_EXPR}                      				 { yybegin(YYINITIAL); return UssTypes.COMMENT; }
<YYINITIAL> {CRLF}+												{ yybegin(YYINITIAL); return UssTypes.CRLF; }


<YYINITIAL> {L_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.L_PARENTHESIS; }


<YYINITIAL> {ELEMENT}                                     { yybegin(ELEMENT_DEFINITION); return UssTypes.ELEMENT; }
<YYINITIAL> {BINDING}                                     { yybegin(BINDING_DEFINITION); return UssTypes.BINDING; }

<YYINITIAL> {BLOCK}                                     { yybegin(YYINITIAL); return UssTypes.BLOCK; }

<YYINITIAL> {CSS}                                     { yybegin(YYINITIAL); return UssTypes.CSS; }

<YYINITIAL> {IMPORT}                                     { yybegin(YYINITIAL); return UssTypes.IMPORT; }
<YYINITIAL> {CLASS}                                     { yybegin(YYINITIAL); return UssTypes.CLASS; }

<YYINITIAL> {WORD}                               			 { yybegin(YYINITIAL); return UssTypes.WORD; }


<YYINITIAL> {SEPARATOR}                                     { yybegin(YYINITIAL); return UssTypes.SEPARATOR; }

<YYINITIAL> {R_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }

<ELEMENT_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {ELEMENT_NAME}                                         { return UssTypes.ELEMENT_NAME; }
    {SEPARATOR}+                                    { return UssTypes.SEPARATOR; }
    {EMPTY_TOKEN}                                   { yybegin(YYINITIAL); return UssTypes.EMPTY_TOKEN; }
}

<BINDING_DEFINITION> {
    {SEPARATOR}+                                             { return UssTypes.SEPARATOR; }
    {BINDING_NAME}                                           { return UssTypes.BINDING_NAME; }
    {BINDING_PROP}                                           { return UssTypes.BINDING_PROP; }
    {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }
    {DOUBLE_QUOTE}                                           { yybegin(BINDING_PARAMS); return UssTypes.DOUBLE_QUOTE; }
}

// TODO ; add here
// TODO params for bindings from code(docs)
<BINDING_PARAMS>{
    {WORD}|{L_PARENTHESIS}|{R_PARENTHESIS}                   { return UssTypes.WORD; }
    {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }
    {DOUBLE_QUOTE}                                           { yybegin(YYINITIAL); return UssTypes.DOUBLE_QUOTE; }
}

.                                                           { return TokenType.BAD_CHARACTER; }