package org.intellij.sdk.language;

import com.intellij.lang.Language;

public class UssLanguage extends Language {
    public static final UssLanguage INSTANCE = new UssLanguage();

    private UssLanguage() {
        super("USS");
    }
}