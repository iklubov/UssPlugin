package org.intellij.sdk.language;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.*;

import javax.swing.*;

/**
 * Created by 34 on 21.12.2016.
 */
public class UssFileType extends LanguageFileType {
    public static final UssFileType instance = new UssFileType();

    private UssFileType() {
        super(UssLanguage.getInstance());
    }

    @NotNull
    @Override
    public String getName() {
        return "Uss file";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "Uss language file";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "uss";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return UssIcons.FILE;
    }
}
