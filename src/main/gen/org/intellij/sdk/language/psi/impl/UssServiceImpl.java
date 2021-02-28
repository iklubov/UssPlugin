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

public class UssServiceImpl extends ASTWrapperPsiElement implements UssService {

  public UssServiceImpl(@NotNull ASTNode node) {
    super(node);
  }

  public void accept(@NotNull UssVisitor visitor) {
    visitor.visitService(this);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof UssVisitor) accept((UssVisitor)visitor);
    else super.accept(visitor);
  }

}
