// This is a generated file. Not intended for manual editing.
package org.intellij.sdk.language.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface UssToken extends PsiElement {

  @NotNull
  List<UssNameExpr> getNameExprList();

  @NotNull
  List<UssNewline> getNewlineList();

  @NotNull
  List<UssSeparatorExpr> getSeparatorExprList();

  @NotNull
  List<UssService> getServiceList();

  @NotNull
  List<UssToken> getTokenList();

  @NotNull
  List<UssWordExpr> getWordExprList();

}
