// Copyright 2000-2020 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the LICENSE file.

package org.intellij.sdk.language.psi;

import com.intellij.openapi.project.Project;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFileFactory;
import org.intellij.sdk.language.UssFileType;

public class UssElementFactory {

  public static UssProperty createProperty(Project project, String name) {
    final UssFile file = createFile(project, name);
    return (UssProperty) file.getFirstChild();
  }

  public static UssFile createFile(Project project, String text) {
    String name = "dummy.Uss";
    return (UssFile) PsiFileFactory.getInstance(project).createFileFromText(name, UssFileType.instance, text);
  }

  public static UssProperty createProperty(Project project, String name, String value) {
    final UssFile file = createFile(project, name + " = " + value);
    return (UssProperty) file.getFirstChild();
  }

  public static PsiElement createCRLF(Project project) {
    final UssFile file = createFile(project, "\n");
    return file.getFirstChild();
  }

}
