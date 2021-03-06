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

// IDENTIFIERS
BLOCK = "block"
ELEMENT = "element"
CSS = "css"
BINDING = "bind"
INNER_BINDING = "innerBind"
IMPORT = "import"
CLASS = "class"
STYLE = "style"
PARAMS = "params"

// todo replaces must be rewritten
// TODO MOUSE_PLACED_TOOLTIP_BEHAVIOUR
REPLACE_START = \<"replace"
REPLACE_END = "replace"\>
REPLACE_SIMPLE_CONTENT = \'?\-?(\w+|\d+|{FILE_PATH}|{FRACTIONAL_NUMBER}|{SCREEN_SCALE})\'?

// todo replace with bind name
BINDING_PROPERTY = "name"|"text"|"alpha"

// different block types
TEXT_FIELD = "tf"
HBLOCK = "hblock"
MOVIECLIP = "mc"
UBLOCK = "ublock"

SPECIAL_IDENTIFIER = "DeclareBlurLayer"|"HorizontalDivider"|"TooltipSystemHorizontalDivider"|"BlurMap"|"ShipIconLevelName"|"AccountLevellingStepInfoLayout"|"DefaultButtonModal"|"BlurMapCustom"|"TutorialHintHeader"|"TutorialHintDivider"
|"HorizontalDividerTwoPx"|"HeaderShipMarker"|"ShipParamsArray"|"PlaneParamsArray"|"DottedLine"|"DropShadow"|"TaskItemStatus"|"InfotipBg"|"VerticalDivider"|"MenuBg"|"MenuItem"|"ResizeFrame"|"FourColoredIcon"|"OneColoredIcon"|"TwoColoredIcon"
|"TriColoredIcon"|"InfotipPanelBg"|"InfotipPins"|"LinkedEULA"|"FullTextEULA"|"DevTraces"|"BlurMapCustomPxOutbound"|"ModalWindowContainer"|"Underline"|"ModalWindowClanBattlesScheduleContent"|"ClanBattlesScheduleTable"
|"ExtendedSystemLogWindowBG"|"OperationRewardsAdapter"|"ModernizationTextChoosedItemRenderer"|"ExcursionHintBlock"|"CarouselFilters"|"ProfilePlayerPercentEfficiency"|"PVEOperationItemSmallNoMargins"|"IconWarningSmall"
|"SimpleLockPlug"|"MenuItemWithSelection"|"BlurMapCustomOutbound"|"ContextGuidingTipPointerAnimation"|"SimpleTooltipTemplate"|"SubTextTooltipTemplate"|"ModuleTreeHelpBlock"|"DivisionEntranceInfotip"|"NotificationsInfotip"
|"MainTabSmall"|"MenuItemWithAction"|"TrainingRoomShipCarouselContainer"|"ModalWindowTrainingRoomsContent"|"FormationPlayerItem"|"TrainingRoomTextInputContent"|"CustomItemChoosedRenderer"|"CustomItemChooserItemRenderer"
|"UIlistTeamStructureLeft"|"UIlistTeamStructureRight"|"BrowserWindowContent"|"BrowserRender"|"BrowserLoadFailed"|"BlurMapLow"|"ShipCarouselNoCompatibleShips"|"ShipCarouselPurchaseShip"|"ShipCarouselPurchaseShipSlot"
|"ServiceUnfreezeButtons"|"TrainingRoomRestrictions"|"MenuItemWithRequest"|"ContactsAndChannelsInfotip"|"ExpandedGroupTitle"|"NoItemsInGroup"|"FormationMainElement"|"DivisionStatusTransition"|"DockNaviButtons"
|"MenuButton"|"GiftBoxRewardsHeader"|"GiftboxRewardsContent"|"ExteriorHeader"|"CommanderRankShipTraining"|"NotificationModuleHeader"|"PriceTag"|"BannerButton"|"ShipTypeCounter"|"ModalWindowCloseIcon"|"UIListTeamResultLeft"
|"UIListTeamResultRight"

ELEMENT_NAME = \w+
ELEMENT_PARAMS = \w+
CLASS_NAME = "$"\w+
BINDING_NAME = "controller"|"child"|"childParentScope"|"instance"|"event"|"dispatch"|"dispatchDelayReset"|"style"|"class"|"sync"|"repeat"|"repeatCache"|"repeatObject"|"dataRefDH"|"watchDH"|"entityDH"
|"firstEntityDH"|"handleEventDH"|"fxInstance"|"mrMeeseeks"|"collectionDH"|"collectionDHById"|"collectionRepeatDH"|"collectionDesign"|"collectionFields"|"primaryEntityDH"|"clikList"|"draggableWindow"
|"draggable"|"droppable"|"resize"|"appear"|"fade"|"transition"|"timestampTween"|"textCountdown"|"pluralText"|"tooltip"|"popup"|"popupNoCache"|"menu"|"blurLayer"|"blurMap"|"request"|"action"|"focus"|"sequence"
|"feature"|"catch"|"catchProperty"|"var"|"watch"|"actionIsDisplay"|"scopeHoldRepeat"|"substitute"|"scopeTrace"|"changeDispatch"|"countdown"|"file"|"imeEnable"|"linearChart"|"eventSequence"|"contains"|"levelToFeature"
|"timeFormat"|"serverTime"|"generator"|"generatorDH"|"clock"|"inoutAction"|"soundOn"|"blockSize"|"stageCoord"|"scrollController"|"scrollControllerCentered"|"catchDH"|"keyboard"|"debugWrite"|"debugRead"
|"debugReadAll"|"debugSend"|"debugReceive"|"debugRewrite"|"debugTypeOf"|"debugScope"|"debugDataProvider"|"debugBlockInfo"|"debugScopeDraw"|"concat"|"colorTransform"|"clipboard"|"resource"|"slice"|"mc"|"objectUnderPoint"
|"restrictFeedback"|"perFrameUpdate"|"indexOf"|"atlasText"|"timeline"|"battleHint"|"lag"|"makeScreenshot"|"directEvent"|"visible"
BINDING_PROP = \w+{EMPTY_TOKEN}*
BINDING_PROP_FUNCTION = \w+"!"
MOVIECLIP_NAME = \w+(\.\w+)*

NO_PARAMS_BINDING = "stageSize"|"input"|"clickSplit"|"vTileHack"|"dragCursor"

// todo review
CRLF=\r|\n|\r\n
// todo do we need comments of one symbol #?
COMMENT_EXPR = \#[^\r\n]*
L_PARENTHESIS="("
R_PARENTHESIS=")"
DOUBLE_QUOTE = "\""
COLON = ":"
VIRGULE = ","
POINT = "."
SEPARATOR= \s+
WORD = \w+
SINGLE_QUOTE = \'
EMPTY_TOKEN = ["("][\s]*[")"]
CSS_EMPTY_TOKEN = "("(\s*|"_px"|"_wheelScrollSpeed"|"_mouseEnabledWhileScroll")+")"

// SERVICE EXPRESSIONS

// inside style params
HEX_NUMBER = "0x" [0-9A-Fa-f]+
FILE_PATH = "url:" (\.{2} \/ )+ (\w+ \/ )+ \w+ \. \w+
//background9slice
STRANGE_EXPRESSION = (\[\w+(\,{SEPARATOR}*\w+)*\])
CONTROLLER_PATH = \w+(\.\w+)*
BACKGROUND_STYLE_PARAM = \w+\:\w+
DROPSHADOW_FILTER = ((("0x")?\-?\d+(\.\d+)?) | \s+)+
HTML_PART = (\w+|\s+|{CRLF}|"{"|"}"|":"|"#"|";"|".")+

SCREEN_SIZE_TYPE = \-?("SXS"|"MS"|"M"|"XXS"|"XS"|"S"|"L"|"XL"|"XXL"|"XLL"|"XXXL"|"XXLXL"|"LM"|"LS"|"XLM"|"SERVICE_UI_COLOR_YELLOW"|"TA"|"TC"){1}{EMPTY_TOKEN}
SCREEN_SCALE_TYPE = "aw"|"ah"
REPLACE_EXPRESSION = ([A-Z]+\_)*[A-Z]+ | "abs" | "trace" | "rtrace" //REPLACE_NAME
REPLACE_EXPRESSION_NAME = ([A-Z]+\_)*[A-Z]+(\_\d)? | "abs" | "trace" | "rtrace" //REPLACE_NAME
REPLACE_PARAMS = (\,?{SEPARATOR}*\_\w+)+
// todo 100%px is real, 100%% as well, 100f%
// todo strange 50x
PERCENTAGE_NUMBER = \-?\d+(\.\d+)?("f"|"px"|"x")?\%{1,2}("f"|"px"|"x")?
// and negative))

FRACTIONAL_NUMBER = \-?\d+(\.\d+)?("px"|"sw"|"sh"|"x")?
// todo _width and drop_down_list_item
STYLE_PARAM_LIST = "absolute"|"overflow"|"scroll"|"fill"|"horizontal"|"vertical"|"false"|"true"|"cover"|"center"|"htile"|"vtile"|"right"|"middle"|"left"|"justify"|"hidden"|"bottom"|"drop_down_list_item"|"screenshot"
|"auto"|"_width"|"_wheelScrollSpeed"|"_mouseEnabledWhileScroll"|"virtual"
STYLE_PARAM_SPECIAL = {STYLE_PARAM_LIST} (\|{STYLE_PARAM_LIST})*
// todo another strange element at the end
STYLE_PIXEL_PARAM = (\-*\d+ | ({SCREEN_SIZE_TYPE})) ("px"|"sw")?("|0")?
STYLE_PIXEL_PARAM_WITH_OR = {STYLE_PIXEL_PARAM} (\|{STYLE_PIXEL_PARAM})*
STYLE_PARAM_REPLACE = {REPLACE_EXPRESSION}{EMPTY_TOKEN}("px"|"sw")?
//userData at css CRAZY SHIT
USER_DATA_0 = \-?(\w+|\.|'right'|'left')+
USER_DATA = \{({SEPARATOR}|{CRLF})*\w+\:({SEPARATOR})*{USER_DATA_0}(({SEPARATOR}|{CRLF})*\,({SEPARATOR}|{CRLF})*\w+\:({SEPARATOR}|{CRLF})*{USER_DATA_0})*({SEPARATOR}|{CRLF})*\}
STYLE_SHEET = \w+({SEPARATOR}|{CRLF})*\{(\w+|\:|\;|\$|\-|\#|{SEPARATOR}|{CRLF})+\}
VAR_NAME = "_px"|"_label"

RESTRICTIONS_IN_PARAMS = "^<>"



// todo - paths are not the only one
WORD_INSIDE_QUOTE = {DOUBLE_QUOTE} ({FILE_PATH}|{STRANGE_EXPRESSION}|{CONTROLLER_PATH}|{BACKGROUND_STYLE_PARAM}|{DROPSHADOW_FILTER}|{HTML_PART}|{SCREEN_SCALE}|{USER_DATA}|{STYLE_SHEET}|{RESTRICTIONS_IN_PARAMS}) {DOUBLE_QUOTE}
//(dropShadowFilter "")
EMPTY_QUOTES = {DOUBLE_QUOTE}{DOUBLE_QUOTE}
SCREEN_SCALE = \d+\:{STYLE_PIXEL_PARAM}{VIRGULE}{SEPARATOR}*\d+\:{STYLE_PIXEL_PARAM}{SCREEN_SCALE_TYPE}
//SCREEN_SCALE_NUMBER = \d+\:\d+{VIRGULE}\d+\:\d+{SCREEN_SCALE_TYPE}


// todo inner binding stuff
INNER_BINDING_PARAM_2 = \w+(\.\w+)*\!?


//TODO MAKE SYNTAX SUPPORT FOR THESE PARAMS
//todo "-", "—" and "–" are different!
BINDING_INSIDE_PARAMS = ({WORD}|{SEPARATOR}|{L_PARENTHESIS}|{R_PARENTHESIS}|{COLON}|{VIRGULE}|"{"|"}"|"."|"'"|";"|":"|">"|"<"|"="|"?"|"/"|"["|"]"|"!"|"&"|"|"|"$"|"+"|"-"|"*"|"—"|"%"|"№"|"^"|"#"|"–"|"•"|"…")+

// COMPLEX PARAMS IN DESIGN COLLECTION BINDING
REPLACE_INSIDE_PARAMS =  ({DOUBLE_QUOTE} ({WORD}|{VIRGULE}|{SEPARATOR}+|"."|"'"|"{"|"}"|"!"|"&"|"|"|"$"|":"|"?"|"="|"["|"]"|")"|"("|">"|"<"|"+"|"-"|",")* {DOUBLE_QUOTE}{SEPARATOR}*{VIRGULE}*{SEPARATOR}*)+
// for inner bind
REPLACE_INSIDE_PARAMS_INNER_BIND =  ({DOUBLE_QUOTE} ({WORD}|{VIRGULE}|{SEPARATOR}+|{CRLF}|"."|"'"|"{"|"}"|"!"|"&"|"|"|"$"|":"|"?"|"="|"["|"]"|")"|"("|">"|"<"|"+"|"-"|",")* {DOUBLE_QUOTE}{SEPARATOR}*{VIRGULE}*{SEPARATOR}*)+

TEMPLATE_INSIDE_PARAMS = ({WORD}|{SEPARATOR}|{COLON}|{VIRGULE}|"{"|"}"|"."|"'"|";"|":"|">"|"<"|"="|"?"|"/"|"["|"]"|"!"|"&"|"|"|"$"|"+"|"-"|"*"|"—"|"%"|"№"|"^"|"#"|"–"|"!")+
// todo shit
TEMPLATE_INSIDE_QUOTE = {DOUBLE_QUOTE}({TEMPLATE_INSIDE_PARAMS}|"("|")")+{DOUBLE_QUOTE}
TEMPLATE_PARAMS = "(template" ({TEMPLATE_INSIDE_PARAMS}|{TEMPLATE_INSIDE_QUOTE})+  ")"



%state CSS_DEFINITION
%state ELEMENT_DEFINITION
%state BINDING_DEFINITION
%state INNER_BINDING_DEFINITION
%state STYLE_DEFINITION
%state CLASS_DEFINITION
%state REPLACE_USAGE
%state REPLACE_DEFINITION
%state MOVIECLIP_DEFINITION
%state SPECIAL_IDENTIFIER_DEFINITION

%state BINDING_PARAMS
%state STYLE_PARAMS
%state CSS_PARAMS




%%



<YYINITIAL> {COMMENT_EXPR}                      				 { yybegin(YYINITIAL); return UssTypes.COMMENT; }
<YYINITIAL> {CRLF}+												{ yybegin(YYINITIAL); return UssTypes.CRLF; }
<YYINITIAL> {SEPARATOR}                                     { yybegin(YYINITIAL); return UssTypes.SEPARATOR; }
<YYINITIAL> {REPLACE_START}                                     { yybegin(REPLACE_DEFINITION); return UssTypes.REPLACE_START; }
<YYINITIAL> {REPLACE_END}                                     { yybegin(YYINITIAL); return UssTypes.REPLACE_END; }

<YYINITIAL> {CSS}                                         { yybegin(CSS_DEFINITION); return UssTypes.CSS; }

<YYINITIAL> {L_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.L_PARENTHESIS; }

<YYINITIAL> {ELEMENT}                                       { yybegin(ELEMENT_DEFINITION); return UssTypes.ELEMENT; }
// TOP LEVEL COMMON USE
<YYINITIAL> {BINDING}                                       { yybegin(BINDING_DEFINITION); return UssTypes.BINDING; }
<YYINITIAL> {INNER_BINDING}                                  { yybegin(INNER_BINDING_DEFINITION); return UssTypes.INNER_BINDING; }
<YYINITIAL> {BINDING_PROPERTY}                              { yybegin(BINDING_DEFINITION); return UssTypes.BINDING; }
<YYINITIAL> {STYLE}                                          { yybegin(STYLE_DEFINITION); return UssTypes.STYLE; }
<YYINITIAL> {CLASS}                                         { yybegin(CLASS_DEFINITION); return UssTypes.CLASS; }
<YYINITIAL> {BLOCK}                                     { yybegin(YYINITIAL); return UssTypes.BLOCK; }
<YYINITIAL> {TEXT_FIELD}                                     { yybegin(YYINITIAL); return UssTypes.TEXT_FIELD; }
<YYINITIAL> {HBLOCK}                                     { yybegin(YYINITIAL); return UssTypes.HBLOCK; }
<YYINITIAL> {UBLOCK}                                     { yybegin(MOVIECLIP_DEFINITION); return UssTypes.UBLOCK; }
<YYINITIAL> {MOVIECLIP}                                     { yybegin(MOVIECLIP_DEFINITION); return UssTypes.MOVIECLIP; }

//looks like style
<YYINITIAL> {PARAMS}                                         { yybegin(STYLE_DEFINITION); return UssTypes.PARAMS; }

<YYINITIAL> {SPECIAL_IDENTIFIER}                         { yybegin(SPECIAL_IDENTIFIER_DEFINITION); return UssTypes.SPECIAL_IDENTIFIER; }

<YYINITIAL> {R_PARENTHESIS}                                     { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }

// todo divide replace definition
<YYINITIAL> {REPLACE_EXPRESSION}                         { yybegin(REPLACE_USAGE); return UssTypes.REPLACE_EXPRESSION; }
<YYINITIAL> {REPLACE_SIMPLE_CONTENT}                         { yybegin(YYINITIAL); return UssTypes.REPLACE_SIMPLE_CONTENT; }
<YYINITIAL> {SCREEN_SCALE}                                 { yybegin(YYINITIAL); return UssTypes.REPLACE_SIMPLE_CONTENT; }

//<YYINITIAL> {IMPORT}                                     { yybegin(YYINITIAL); return UssTypes.IMPORT; }



<REPLACE_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {REPLACE_EXPRESSION_NAME}                               { return UssTypes.ELEMENT_NAME; }
    {L_PARENTHESIS}                                    { return UssTypes.L_PARENTHESIS; }
    {REPLACE_PARAMS}                                    { return UssTypes.REPLACE_PARAMS; }
    {SCREEN_SCALE}                                    { return UssTypes.REPLACE_PARAMS; }
    {R_PARENTHESIS}                                    { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}

<ELEMENT_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {ELEMENT_NAME}                                    { return UssTypes.ELEMENT_NAME; }
    {L_PARENTHESIS}                                    {return UssTypes.L_PARENTHESIS; }
      {ELEMENT_PARAMS}                                  { return UssTypes.ELEMENT_NAME; }
     {R_PARENTHESIS}                                  { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}


<CSS_DEFINITION> {
    {COMMENT_EXPR}                                    { return UssTypes.COMMENT_EXPR; }
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {CLASS_NAME}                                    { return UssTypes.CLASS_NAME; }
      {EMPTY_TOKEN}|{CSS_EMPTY_TOKEN}                                    { return UssTypes.EMPTY_TOKEN; }
   {L_PARENTHESIS}                                    {yybegin(CSS_PARAMS);  return UssTypes.L_PARENTHESIS; }
    {R_PARENTHESIS}                                  { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}


<INNER_BINDING_DEFINITION> {
     {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }
    {INNER_BINDING_PARAM_2}                                           { return UssTypes.INNER_BINDING_PARAM_2; }
    {REPLACE_INSIDE_PARAMS_INNER_BIND}                                           { return UssTypes.REPLACE_INSIDE_PARAMS; }
    {R_PARENTHESIS}                                          { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}

<BINDING_DEFINITION> {
    {BINDING_NAME}                                           { return UssTypes.BINDING_NAME; }
    {NO_PARAMS_BINDING}                                      { return UssTypes.NO_PARAMS_BINDING; }

    {BINDING_PROP}                                           { return UssTypes.BINDING_PROP; }
    {BINDING_PROP_FUNCTION}                                  { return UssTypes.BINDING_PROP_FUNCTION; }
    {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }
    {FRACTIONAL_NUMBER}                                        { return UssTypes.WORD; }
    {WORD}                                                   { return UssTypes.WORD; }
    //(bind text licenseData.licenseText)
    {POINT}                                                  { return UssTypes.WORD; }
    {TEMPLATE_PARAMS}                                        { return UssTypes.TEMPLATE; }
    {DOUBLE_QUOTE}                                           { yybegin(BINDING_PARAMS); return UssTypes.DOUBLE_QUOTE; }
    {SINGLE_QUOTE}                                           { return UssTypes.WORD; }
    {R_PARENTHESIS}                                          { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}

<STYLE_DEFINITION> {
    {SEPARATOR}+                                      { return UssTypes.SEPARATOR; }
    {L_PARENTHESIS}                                    { yybegin(STYLE_PARAMS); return UssTypes.L_PARENTHESIS; }
    {EMPTY_TOKEN}                                       { yybegin(YYINITIAL); return UssTypes.EMPTY_TOKEN; }
    {COMMENT_EXPR}                                       { return UssTypes.COMMENT_EXPR; }
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


<REPLACE_USAGE> {
      {L_PARENTHESIS}                                    {  return UssTypes.L_PARENTHESIS; }
      {REPLACE_INSIDE_PARAMS}                                        { return UssTypes.REPLACE_INSIDE_PARAMS; }
      {R_PARENTHESIS}                                      { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}

<SPECIAL_IDENTIFIER_DEFINITION> {
      {SEPARATOR}                                                    { return UssTypes.SEPARATOR; }
      {REPLACE_INSIDE_PARAMS}                                        { return UssTypes.REPLACE_INSIDE_PARAMS; }
      ({WORD}|{POINT})+                                                       { return UssTypes.REPLACE_INSIDE_PARAMS; }
      {R_PARENTHESIS}                                      { yybegin(YYINITIAL); return UssTypes.R_PARENTHESIS; }
}




// TODO ; add here
// TODO params for bindings from code(docs)
// TODO params for templates
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
     // TODO ERROR
     {EMPTY_QUOTES}                                           { return UssTypes.EMPTY_QUOTES; }
     {HEX_NUMBER}                                               { return UssTypes.HEX_NUMBER; }
     {PERCENTAGE_NUMBER}                                        { return UssTypes.PERCENTAGE_NUMBER; }
     {STYLE_PARAM_SPECIAL}                                       { return UssTypes.STYLE_PARAM_SPECIAL; }
     {STYLE_PIXEL_PARAM_WITH_OR}                                 { return UssTypes.STYLE_PIXEL_PARAM; }
      {FRACTIONAL_NUMBER}                                        { return UssTypes.FRACTIONAL_NUMBER; }
      {STYLE_PARAM_REPLACE}                                      { return UssTypes.FRACTIONAL_NUMBER; }
      {VAR_NAME}                                                { return UssTypes.FRACTIONAL_NUMBER; }
      {CLASS_NAME}                                                { return UssTypes.FRACTIONAL_NUMBER; }
      //todo  src/Lux/lesta/unbound/style/UbStyleParser.as
      // all styles available
      {ELEMENT_NAME}                                         { return UssTypes.ELEMENT_NAME; }
      {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }

     {R_PARENTHESIS}                                      { yybegin(STYLE_DEFINITION); return UssTypes.R_PARENTHESIS; }
}

// COPYPASTA BECAUSE NO WAY TO SEND STATE WHERE TO RETURN
<CSS_PARAMS>{
    // todo list of correct style params instead of ELEMENT_NAME

     {SCREEN_SCALE}                                             { return UssTypes.SCREEN_SCALE; }
     {WORD_INSIDE_QUOTE}                                       { return UssTypes.WORD_INSIDE_QUOTE; }
     // TODO ERROR
     {EMPTY_QUOTES}                                              { return UssTypes.EMPTY_QUOTES; }
     {HEX_NUMBER}                                               { return UssTypes.HEX_NUMBER; }
     {PERCENTAGE_NUMBER}                                        { return UssTypes.PERCENTAGE_NUMBER; }
     {STYLE_PARAM_SPECIAL}                                       { return UssTypes.STYLE_PARAM_SPECIAL; }
     {STYLE_PIXEL_PARAM_WITH_OR}                                 { return UssTypes.STYLE_PIXEL_PARAM; }
      {FRACTIONAL_NUMBER}                                        { return UssTypes.FRACTIONAL_NUMBER; }
      {STYLE_PARAM_REPLACE}                                      { return UssTypes.FRACTIONAL_NUMBER; }
       {VAR_NAME}                                                { return UssTypes.FRACTIONAL_NUMBER; }
      //todo  src/Lux/lesta/unbound/style/UbStyleParser.as
      // all styles available
      {ELEMENT_NAME}                                         { return UssTypes.ELEMENT_NAME; }
      {CLASS_NAME}                                                { return UssTypes.CLASS_NAME; }
      {SEPARATOR}+                                              { return UssTypes.SEPARATOR; }

     {R_PARENTHESIS}                                      { yybegin(CSS_DEFINITION); return UssTypes.R_PARENTHESIS; }
}

.                                                           { return TokenType.BAD_CHARACTER; }