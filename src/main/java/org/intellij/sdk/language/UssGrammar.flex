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

// todo review
L_PARENTHESIS="("
R_PARENTHESIS=")"
DOUBLE_QUOTE = "\""
COLON = [":"]
VIRGULE = ","
SEPARATOR= \s+
WORD = \w+
EMPTY_TOKEN = ["("][\s]*[")"]

// SERVICE EXPRESSIONS
//WORD_EXP = ([A-Fa-f]+)

HEX_NUMBER = "0x" [0-9A-Fa-f]+
FILE_PATH = "url:" (\.{2} \/ )+ (\w+ \/ )+ \w+ \. \w+
SCREEN_SIZE_TYPE = "SXS"|"MS"|"M"|"XXS"|"XS"|"S"|"L"
SCREEN_SCALE_TYPE = "aw"|"ah"
REPLACE_EXPRESSION = ([0-9A-Z]+\_)*[0-9A-Z]+
PERCENTAGE_NUMBER = \d+\%
STYLE_PARAM_SPECIAL = "absolute"|"overflow"|"scroll"
STYLE_PIXEL_PARAM = (\-*\d+ | ({SCREEN_SIZE_TYPE}{EMPTY_TOKEN})) "px"

// todo - paths are not the only one
WORD_INSIDE_QUOTE = {DOUBLE_QUOTE} {FILE_PATH} {DOUBLE_QUOTE}
SCREEN_SCALE = \d+\:{SCREEN_SIZE_TYPE}{EMPTY_TOKEN}{VIRGULE}\d+\:{SCREEN_SIZE_TYPE}{EMPTY_TOKEN}{SCREEN_SCALE_TYPE}



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

// different block types
TEXT_FIELD = "tf"
HBLOCK = "hblock"
MOVIECLIP = "mc"

SPECIAL_IDENTIFIER = "DeclareBlurLayer"|"HorizontalDivider"

ELEMENT_NAME = \w+
CLASS_NAME = "$"\w+
BINDING_NAME = "controller"|"child"|"childParentScope"|"instance"|"event"|"dispatch"|"dispatchDelayReset"|"style"|"class"|"sync"|"repeat"|"repeatCache"|"repeatObject"|"dataRefDH"|"watchDH"|"entityDH"|"firstEntityDH"|"handleEventDH"|"fxInstance"|"mrMeeseeks"|"collectionDH"|"collectionDHById"|"collectionRepeatDH"|"collectionDesign"|"collectionFields"|"primaryEntityDH"|"clikList"|"draggableWindow"|"draggable"|"droppable"|"resize"|"appear"|"fade"|"transition"|"timestampTween"|"textCountdown"|"pluralText"|"tooltip"|"popup"|"popupNoCache"|"menu"|"blurLayer"|"blurMap"|"input"|"request"|"action"|"focus"|"sequence"|"feature"|"catch"|"catchProperty"|"var"|"watch"|"actionIsDisplay"|"scopeHoldRepeat"|"clickSplit"|"substitute"|"scopeTrace"|"changeDispatch"|"countdown"|"file"|"imeEnable"|"linearChart"|"eventSequence"|"contains"|"levelToFeature"|"timeFormat"|"serverTime"|"generator"|"generatorDH"|"clock"|"inoutAction"|"soundOn"|"vTileHack"|"blockSize"|"stageCoord"|"scrollController"|"scrollControllerCentered"|"catchDH"|"keyboard"|"debugWrite"|"debugRead"|"debugReadAll"|"debugSend"|"debugReceive"|"debugRewrite"|"debugTypeOf"|"debugScope"|"debugDataProvider"|"debugBlockInfo"|"debugScopeDraw"|"concat"|"colorTransform"|"clipboard"|"resource"|"slice"|"mc"|"objectUnderPoint"|"restrictFeedback"|"perFrameUpdate"|"indexOf"|"atlasText"|"timeline"|"battleHint"|"lag"|"dragCursor"|"makeScreenshot"|"directEvent"|"visible"
BINDING_PROP = \w+
BINDING_PROP_FUNCTION = \w+"!"
MOVIECLIP_NAME = \w+

NO_PARAMS_BINDING = "stageSize"

//TODO REMOVE
BINDING_INSIDE_PARAMS = ({WORD}|{SEPARATOR}|{L_PARENTHESIS}|{R_PARENTHESIS}|{COLON}|{VIRGULE}|"{"|"}"|"."|"'"|";"|":"|">"|"<"|"="|"?"|"/"|"["|"]"|"!"|"&"|"|")+

//WHITE_SPACE=[\ \n\t\f]
//COMMENT=("//")[^\r\n]*
//FIRST_VALUE_CHARACTER=[(]//[^ \n\f\\] | "\\"{CRLF} | "\\".
//VALUE_CHARACTER=[^\n\f\\] | "\\"{CRLF} | "\\".
//END_OF_LINE_COMMENT=("#"|"!")[^\r\n]*



%state ELEMENT_DEFINITION
%state BINDING_DEFINITION
%state STYLE_DEFINITION
%state CLASS_DEFINITION
%state REPLACE_DEFINITION
%state MOVIECLIP_DEFINITION

%state BINDING_PARAMS
%state STYLE_PARAMS




%%



<YYINITIAL> {COMMENT_EXPR}                      				 { yybegin(YYINITIAL); return UssTypes.COMMENT; }
<YYINITIAL> {CRLF}+												{ yybegin(YYINITIAL); return UssTypes.CRLF; }
<YYINITIAL> {SEPARATOR}                                     { yybegin(YYINITIAL); return UssTypes.SEPARATOR; }


<YYINITIAL> {L_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.L_PARENTHESIS; }

<YYINITIAL> {ELEMENT}                                       { yybegin(ELEMENT_DEFINITION); return UssTypes.ELEMENT; }
<YYINITIAL> {BINDING}                                       { yybegin(BINDING_DEFINITION); return UssTypes.BINDING; }
<YYINITIAL> {STYLE}                                          { yybegin(STYLE_DEFINITION); return UssTypes.STYLE; }
<YYINITIAL> {CLASS}                                         { yybegin(CLASS_DEFINITION); return UssTypes.CLASS; }

// todo

<YYINITIAL> {BLOCK}                                     { yybegin(YYINITIAL); return UssTypes.BLOCK; }
<YYINITIAL> {TEXT_FIELD}                                     { yybegin(YYINITIAL); return UssTypes.TEXT_FIELD; }
<YYINITIAL> {HBLOCK}                                     { yybegin(YYINITIAL); return UssTypes.HBLOCK; }
<YYINITIAL> {MOVIECLIP}                                     { yybegin(MOVIECLIP_DEFINITION); return UssTypes.MOVIECLIP; }
<YYINITIAL> {CSS}                                     { yybegin(YYINITIAL); return UssTypes.CSS; }
<YYINITIAL> {SPECIAL_IDENTIFIER}                         { yybegin(YYINITIAL); return UssTypes.SPECIAL_IDENTIFIER; }
<YYINITIAL> {REPLACE_EXPRESSION}                         { yybegin(REPLACE_DEFINITION); return UssTypes.REPLACE_EXPRESSION; }

<YYINITIAL> {IMPORT}                                     { yybegin(YYINITIAL); return UssTypes.IMPORT; }
//
//<YYINITIAL> {WORD}                               			 { yybegin(YYINITIAL); return UssTypes.WORD; }

<YYINITIAL> {R_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
//<YYINITIAL> {DOUBLE_QUOTE}                                     { yybegin(YYINITIAL); return UssTypes.DOUBLE_QUOTE; }


<ELEMENT_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {ELEMENT_NAME}                                    { return UssTypes.ELEMENT_NAME; }
    {EMPTY_TOKEN}                                     { yybegin(YYINITIAL); return UssTypes.EMPTY_TOKEN; }
}

//<BLOCK_DEFINITION> {
//    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
//}

<BINDING_DEFINITION> {
    {SEPARATOR}+                                             { return UssTypes.SEPARATOR; }
    {BINDING_NAME}                                           { return UssTypes.BINDING_NAME; }
    {NO_PARAMS_BINDING}                                      { yybegin(BINDING_PARAMS); return UssTypes.NO_PARAMS_BINDING; }
    {BINDING_PROP}                                           { return UssTypes.BINDING_PROP; }
    {BINDING_PROP_FUNCTION}                                  { return UssTypes.BINDING_PROP_FUNCTION; }
    {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }
    {DOUBLE_QUOTE}                                           { yybegin(BINDING_PARAMS); return UssTypes.DOUBLE_QUOTE; }
}

<STYLE_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {L_PARENTHESIS}                                    { yybegin(STYLE_PARAMS); return UssTypes.L_PARENTHESIS; }
    {EMPTY_TOKEN}                                       { yybegin(YYINITIAL); return UssTypes.EMPTY_TOKEN; }
    {R_PARENTHESIS}                                      { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}

<CLASS_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {CLASS_NAME}                                      { yybegin(YYINITIAL); return UssTypes.CLASS_NAME; }
}

<MOVIECLIP_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {MOVIECLIP_NAME}                                  { yybegin(YYINITIAL); return UssTypes.MOVIECLIP_NAME; }
}


<REPLACE_DEFINITION> {
      {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
      {EMPTY_TOKEN}                                       { yybegin(YYINITIAL); return UssTypes.EMPTY_TOKEN; }
      {L_PARENTHESIS}                                    {  return UssTypes.L_PARENTHESIS; }
      {DOUBLE_QUOTE}                                        { return UssTypes.DOUBLE_QUOTE; }
      {WORD}                                           { return UssTypes.WORD; }
      {VIRGULE}                                           { return UssTypes.VIRGULE; }
      {R_PARENTHESIS}                                      { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}




// TODO ; add here
// TODO params for bindings from code(docs)
<BINDING_PARAMS>{
    {BINDING_INSIDE_PARAMS}                                              { return UssTypes.WORD; }
    {SEPARATOR}+                                                         { return UssTypes.SEPARATOR; }
    {DOUBLE_QUOTE}                                                       { yybegin(YYINITIAL); return UssTypes.DOUBLE_QUOTE; }
}

//
<STYLE_PARAMS>{
    // todo list of correct style params instead of ELEMENT_NAME

     {SCREEN_SCALE}                                             { return UssTypes.SCREEN_SCALE; }
     {WORD_INSIDE_QUOTE}                                       { return UssTypes.WORD_INSIDE_QUOTE; }
     {HEX_NUMBER}                                               { return UssTypes.HEX_NUMBER; }
     {PERCENTAGE_NUMBER}                                        { return UssTypes.PERCENTAGE_NUMBER; }
     {STYLE_PARAM_SPECIAL}                                       { return UssTypes.STYLE_PARAM_SPECIAL; }
     {STYLE_PIXEL_PARAM}                                       { return UssTypes.STYLE_PIXEL_PARAM; }
      //todo  src/Lux/lesta/unbound/style/UbStyleParser.as
      // all styles available
      {ELEMENT_NAME}                                         { return UssTypes.ELEMENT_NAME; }
      {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }

     {R_PARENTHESIS}                                      { yybegin(STYLE_DEFINITION); return UssTypes.R_PARENTHESIS; }
}

.                                                           { return TokenType.BAD_CHARACTER; }