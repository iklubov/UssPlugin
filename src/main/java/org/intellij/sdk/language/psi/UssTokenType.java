// Copyright 2000-2020 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the LICENSE file.

package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.UssLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class UssTokenType extends IElementType {

  public UssTokenType(@NotNull @NonNls String debugName) {
    super(debugName, UssLanguage.getInstance());
  }

  @Override
  public String toString() {
    return "UssTokenType." + super.toString();
  }

}
