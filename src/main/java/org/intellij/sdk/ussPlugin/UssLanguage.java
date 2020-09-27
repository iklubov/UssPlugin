package org.intellij.sdk.ussPlugin;

/**
 * Created by 34 on 20.12.2016.
 */
import com.intellij.lang.Language;

public class UssLanguage extends Language{
    private static UssLanguage ourInstance = new UssLanguage();

    public static UssLanguage getInstance() {
        return ourInstance;
    }

    private UssLanguage() {
        super("Uss");
    }
}
