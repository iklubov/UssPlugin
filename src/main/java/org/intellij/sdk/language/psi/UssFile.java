// Copyright 2000-2020 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the LICENSE file.

package org.intellij.sdk.language.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import org.intellij.sdk.language.UssFileType;
import org.intellij.sdk.language.UssLanguage;
import org.jetbrains.annotations.NotNull;

public class UssFile extends PsiFileBase {

  public UssFile(@NotNull FileViewProvider viewProvider) {
    super(viewProvider, UssLanguage.getInstance());
  }

  @NotNull
  @Override
  public FileType getFileType() {
    return UssFileType.instance;
  }

  @Override
  public String toString() {
    return "Uss File";
  }

}
