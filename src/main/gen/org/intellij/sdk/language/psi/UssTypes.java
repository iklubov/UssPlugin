// This is a generated file. Not intended for manual editing.
package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import com.intellij.psi.PsiElement;
import com.intellij.lang.ASTNode;
import org.intellij.sdk.language.psi.impl.*;

public interface UssTypes {

  IElementType COMMENT = new UssElementType("COMMENT");
  IElementType NAME_EXPR = new UssElementType("NAME_EXPR");
  IElementType NEWLINE = new UssElementType("NEWLINE");
  IElementType SEPARATOR_EXPR = new UssElementType("SEPARATOR_EXPR");
  IElementType SERVICE = new UssElementType("SERVICE");
  IElementType TOKEN = new UssElementType("TOKEN");
  IElementType WORD_EXPR = new UssElementType("WORD_EXPR");

  IElementType BINDING = new UssTokenType("BINDING");
  IElementType BINDING_NAME = new UssTokenType("BINDING_NAME");
  IElementType BINDING_PROP = new UssTokenType("BINDING_PROP");
  IElementType BLOCK = new UssTokenType("BLOCK");
  IElementType CLASS = new UssTokenType("CLASS");
  IElementType COMMENT_EXPR = new UssTokenType("COMMENT_EXPR");
  IElementType CRLF = new UssTokenType("CRLF");
  IElementType CSS = new UssTokenType("CSS");
  IElementType DOUBLE_QUOTE = new UssTokenType("DOUBLE_QUOTE");
  IElementType ELEMENT = new UssTokenType("ELEMENT");
  IElementType ELEMENT_NAME = new UssTokenType("ELEMENT_NAME");
  IElementType EMPTY_TOKEN = new UssTokenType("EMPTY_TOKEN");
  IElementType IMPORT = new UssTokenType("IMPORT");
  IElementType L_PARENTHESIS = new UssTokenType("L_PARENTHESIS");
  IElementType R_PARENTHESIS = new UssTokenType("R_PARENTHESIS");
  IElementType SEPARATOR = new UssTokenType("SEPARATOR");
  IElementType WORD = new UssTokenType("WORD");

  class Factory {
    public static PsiElement createElement(ASTNode node) {
      IElementType type = node.getElementType();
      if (type == COMMENT) {
        return new UssCommentImpl(node);
      }
      else if (type == NAME_EXPR) {
        return new UssNameExprImpl(node);
      }
      else if (type == NEWLINE) {
        return new UssNewlineImpl(node);
      }
      else if (type == SEPARATOR_EXPR) {
        return new UssSeparatorExprImpl(node);
      }
      else if (type == SERVICE) {
        return new UssServiceImpl(node);
      }
      else if (type == TOKEN) {
        return new UssTokenImpl(node);
      }
      else if (type == WORD_EXPR) {
        return new UssWordExprImpl(node);
      }
      throw new AssertionError("Unknown element type: " + type);
    }
  }
}
