package org.intellij.sdk.language;

import com.intellij.lexer.Lexer;
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors;
import com.intellij.openapi.editor.HighlighterColors;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase;
import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.psi.UssTypes;
import org.jetbrains.annotations.NotNull;

public class UssSyntaxHighlighter extends SyntaxHighlighterBase {


    public static final TextAttributesKey ELEMENT =
            TextAttributesKey.createTextAttributesKey("USS_ELEMENT", DefaultLanguageHighlighterColors.STRING);
    public static final TextAttributesKey ELEMENT_NAME =
            TextAttributesKey.createTextAttributesKey("USS_ELEMENT_NAME", DefaultLanguageHighlighterColors.METADATA);
    public static final TextAttributesKey BLOCK =
            TextAttributesKey.createTextAttributesKey("USS_BLOCK", DefaultLanguageHighlighterColors.INSTANCE_FIELD);
    public static final TextAttributesKey STYLE =
            TextAttributesKey.createTextAttributesKey("USS_STYLE", DefaultLanguageHighlighterColors.STATIC_FIELD);
    public static final TextAttributesKey STYLE_PARAMS =
            TextAttributesKey.createTextAttributesKey("USS_STYLE_PARAMS", DefaultLanguageHighlighterColors.CONSTANT);
    public static final TextAttributesKey BINDING =
            TextAttributesKey.createTextAttributesKey("USS_BINDING", DefaultLanguageHighlighterColors.STATIC_FIELD);
    public static final TextAttributesKey BINDING_PARAMS =
            TextAttributesKey.createTextAttributesKey("USS_BINDING_PARAMS", DefaultLanguageHighlighterColors.LABEL);
    public static final TextAttributesKey CLASS =
            TextAttributesKey.createTextAttributesKey("USS_CLASS", DefaultLanguageHighlighterColors.MARKUP_ATTRIBUTE);
    public static final TextAttributesKey CSS =
            TextAttributesKey.createTextAttributesKey("USS_CSS", DefaultLanguageHighlighterColors.MARKUP_ATTRIBUTE);
    public static final TextAttributesKey REPLACE =
            TextAttributesKey.createTextAttributesKey("USS_REPLACE", DefaultLanguageHighlighterColors.NUMBER);
    public static final TextAttributesKey SEPARATOR =
            TextAttributesKey.createTextAttributesKey("USS_SEPARATOR", DefaultLanguageHighlighterColors.OPERATION_SIGN);
    public static final TextAttributesKey COMMENT =
            TextAttributesKey.createTextAttributesKey("USS_COMMENT", DefaultLanguageHighlighterColors.LINE_COMMENT);
    public static final TextAttributesKey BAD_CHARACTER =
            TextAttributesKey.createTextAttributesKey("USS_BAD_CHARACTER", HighlighterColors.BAD_CHARACTER);




    private static final TextAttributesKey[] ELEMENT_KEYS = new TextAttributesKey[]{ELEMENT};
    private static final TextAttributesKey[] ELEMENT_NAME_KEYS = new TextAttributesKey[]{ELEMENT_NAME};
    private static final TextAttributesKey[] BLOCK_KEYS = new TextAttributesKey[]{BLOCK};
    private static final TextAttributesKey[] SEPARATOR_KEYS = new TextAttributesKey[]{SEPARATOR};
    private static final TextAttributesKey[] COMMENT_KEYS = new TextAttributesKey[]{COMMENT};
    private static final TextAttributesKey[] STYLE_KEYS = new TextAttributesKey[]{STYLE};
    private static final TextAttributesKey[] STYLE_PARAMS_KEYS = new TextAttributesKey[]{STYLE_PARAMS};
    private static final TextAttributesKey[] BINDING_KEYS = new TextAttributesKey[]{BINDING};
    private static final TextAttributesKey[] BINDING_PARAMS_KEYS = new TextAttributesKey[]{BINDING_PARAMS};
    private static final TextAttributesKey[] CLASS_KEYS = new TextAttributesKey[]{CLASS};
    private static final TextAttributesKey[] CSS_KEYS = new TextAttributesKey[]{CSS};
    private static final TextAttributesKey[] REPLACE_KEYS = new TextAttributesKey[]{REPLACE};
    private static final TextAttributesKey[] EMPTY_KEYS = new TextAttributesKey[0];
    private static final TextAttributesKey[] BAD_CHAR_KEYS = new TextAttributesKey[]{BAD_CHARACTER};



    @NotNull
    @Override
    public Lexer getHighlightingLexer() {
        return new UssLexerAdapter();
    }

    @NotNull
    @Override
    public TextAttributesKey[] getTokenHighlights(IElementType tokenType) {
        if (tokenType.equals(UssTypes.ELEMENT))
            return ELEMENT_KEYS;
        else if (tokenType.equals(UssTypes.ELEMENT_NAME))
            return ELEMENT_NAME_KEYS;
        else if (tokenType.equals(UssTypes.BLOCK) || tokenType.equals(UssTypes.HBLOCK) || tokenType.equals(UssTypes.UBLOCK))
            return BLOCK_KEYS;
        else if (tokenType.equals(UssTypes.SEPARATOR))
            return SEPARATOR_KEYS;
        else if (tokenType.equals(UssTypes.COMMENT))
            return COMMENT_KEYS;
        else if (tokenType.equals(UssTypes.STYLE))
            return STYLE_KEYS;
        else if (tokenType.equals(UssTypes.STYLE_PARAM_SPECIAL) || (tokenType.equals(UssTypes.STYLE_PIXEL_PARAM)))
            return STYLE_PARAMS_KEYS;
        else if (tokenType.equals(UssTypes.BINDING))
            return BINDING_KEYS;
        else if (tokenType.equals(UssTypes.BINDING_NAME) || tokenType.equals(UssTypes.BINDING_PROP) )
            return BINDING_PARAMS_KEYS;
        else if (tokenType.equals(UssTypes.CLASS) || tokenType.equals(UssTypes.CLASS_NAME))
            return CLASS_KEYS;
        else if (tokenType.equals(UssTypes.CSS))
            return CSS_KEYS;
        else if (tokenType.equals(UssTypes.REPLACE_EXPRESSION) || tokenType.equals(UssTypes.REPLACE_PARAMS))
            return REPLACE_KEYS;
        else
            return EMPTY_KEYS;
    }
}
