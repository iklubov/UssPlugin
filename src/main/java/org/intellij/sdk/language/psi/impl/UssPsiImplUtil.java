package org.intellij.sdk.language.psi.impl;
import com.intellij.lang.ASTNode;
import org.intellij.sdk.language.psi.UssToken;
import org.intellij.sdk.language.psi.UssTypes;

public class UssPsiImplUtil {
    public static String getKey(UssToken element) {
        ASTNode keyNode = element.getNode().findChildByType(UssTypes.BINDING);
        if (keyNode != null) {
            // IMPORTANT: Convert embedded escaped spaces to simple spaces
            return keyNode.getText().replaceAll("\\\\ ", " ");
        } else {
            return null;
        }
    }

    public static String getValue(UssToken element) {
        ASTNode valueNode = element.getNode().findChildByType(UssTypes.BLOCK_TOKEN);
        if (valueNode != null) {
            return valueNode.getText();
        } else {
            return null;
        }
    }
}
