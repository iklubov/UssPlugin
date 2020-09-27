// Copyright 2000-2020 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the LICENSE file.

package org.intellij.sdk.language.psi.impl;

import com.intellij.lang.ASTNode;
import com.intellij.navigation.ItemPresentation;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;
import org.intellij.sdk.language.UssIcons;
import org.intellij.sdk.language.psi.UssElementFactory;
import org.intellij.sdk.language.psi.UssProperty;
import org.intellij.sdk.language.psi.UssTypes;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class UssPsiImplUtil {

  public static String getKey(UssProperty element) {
    ASTNode keyNode = element.getNode().findChildByType(UssTypes.KEY);
    if (keyNode != null) {
      // IMPORTANT: Convert embedded escaped spaces to Uss spaces
      return keyNode.getText().replaceAll("\\\\ ", " ");
    } else {
      return null;
    }
  }

  public static String getValue(UssProperty element) {
    ASTNode valueNode = element.getNode().findChildByType(UssTypes.VALUE);
    if (valueNode != null) {
      return valueNode.getText();
    } else {
      return null;
    }
  }

  public static String getName(UssProperty element) {
    return getKey(element);
  }

  public static PsiElement setName(UssProperty element, String newName) {
    ASTNode keyNode = element.getNode().findChildByType(UssTypes.KEY);
    if (keyNode != null) {
      UssProperty property = UssElementFactory.createProperty(element.getProject(), newName);
      ASTNode newKeyNode = property.getFirstChild().getNode();
      element.getNode().replaceChild(keyNode, newKeyNode);
    }
    return element;
  }

  public static PsiElement getNameIdentifier(UssProperty element) {
    ASTNode keyNode = element.getNode().findChildByType(UssTypes.KEY);
    if (keyNode != null) {
      return keyNode.getPsi();
    } else {
      return null;
    }
  }

  public static ItemPresentation getPresentation(final UssProperty element) {
    return new ItemPresentation() {
      @Nullable
      @Override
      public String getPresentableText() {
        return element.getKey();
      }

      @Nullable
      @Override
      public String getLocationString() {
        PsiFile containingFile = element.getContainingFile();
        return containingFile == null ? null : containingFile.getName();
      }

      @Override
      public Icon getIcon(boolean unused) {
        return UssIcons.FILE;
      }
    };
  }

}
