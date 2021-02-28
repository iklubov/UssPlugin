package org.intellij.sdk.language.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import org.intellij.sdk.language.UssFileType;
import org.intellij.sdk.language.UssLanguage;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

public class UssFile extends PsiFileBase{
    public UssFile(@NotNull FileViewProvider viewProvider){
        super(viewProvider, UssLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public FileType getFileType() {
        return UssFileType.INSTANCE;
    }

    @Override
    public String toString() {
        return "Uss File";
    }

    @Override
    public Icon getIcon(int flags) {
        return super.getIcon(flags);
    }
}
