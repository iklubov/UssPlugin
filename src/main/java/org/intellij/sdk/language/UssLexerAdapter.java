package org.intellij.sdk.language;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class UssLexerAdapter extends FlexAdapter {
    public UssLexerAdapter(){
        super(new UssLexer((Reader) null));
    }
}
