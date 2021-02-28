// This is a generated file. Not intended for manual editing.
package org.intellij.sdk.language.psi.impl;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.util.PsiTreeUtil;
import static org.intellij.sdk.language.psi.UssTypes.*;
import com.intellij.extapi.psi.ASTWrapperPsiElement;
import org.intellij.sdk.language.psi.*;

public class UssTokenImpl extends ASTWrapperPsiElement implements UssToken {

  public UssTokenImpl(@NotNull ASTNode node) {
    super(node);
  }

  public void accept(@NotNull UssVisitor visitor) {
    visitor.visitToken(this);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof UssVisitor) accept((UssVisitor)visitor);
    else super.accept(visitor);
  }

  @Override
  @NotNull
  public List<UssNameExpr> getNameExprList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssNameExpr.class);
  }

  @Override
  @NotNull
  public List<UssNewline> getNewlineList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssNewline.class);
  }

  @Override
  @NotNull
  public List<UssSeparatorExpr> getSeparatorExprList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssSeparatorExpr.class);
  }

  @Override
  @NotNull
  public List<UssService> getServiceList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssService.class);
  }

  @Override
  @NotNull
  public List<UssToken> getTokenList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssToken.class);
  }

  @Override
  @NotNull
  public List<UssWordExpr> getWordExprList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, UssWordExpr.class);
  }

}
