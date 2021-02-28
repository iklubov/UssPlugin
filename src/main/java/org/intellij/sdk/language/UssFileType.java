package org.intellij.sdk.language;

import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class UssFileType extends LanguageFileType
{
    public static final UssFileType INSTANCE = new UssFileType();

    private UssFileType()
    {
        super(UssLanguage.INSTANCE);
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
        return UssIcon.FILE;
    }

}
