package org.intellij.sdk.language.psi.impl;
import com.intellij.lang.ASTNode;
import org.intellij.sdk.language.psi.UssBindingToken;
import org.intellij.sdk.language.psi.UssTypes;

import java.util.Locale;

public class UssPsiImplUtil {
    public static String getKey(UssBindingToken element) {
        ASTNode keyNode = element.getNode().findChildByType(UssTypes.REPLACE_SIMPLE_CONTENT);
        if (keyNode != null) {
            // IMPORTANT: Convert embedded escaped spaces to simple spaces
            return keyNode.getText().toUpperCase(Locale.ROOT);
        } else {
            return null;
        }
    }

    public static String getValue(UssBindingToken element) {
        ASTNode valueNode = element.getNode().findChildByType(UssTypes.REPLACE_SIMPLE_CONTENT);
        if (valueNode != null) {
            return valueNode.getText();
        } else {
            return null;
        }
    }
}
