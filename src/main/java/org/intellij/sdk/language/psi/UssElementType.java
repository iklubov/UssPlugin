package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.UssLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class UssElementType extends IElementType{
    public UssElementType(@NotNull @NonNls String debugName) {
        super(debugName, UssLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "UssElementType." + super.toString();
    }
}
