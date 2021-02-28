// This is a generated file. Not intended for manual editing.
package org.intellij.sdk.language.parser;

import com.intellij.lang.PsiBuilder;
import com.intellij.lang.PsiBuilder.Marker;
import static org.intellij.sdk.language.psi.UssTypes.*;
import static com.intellij.lang.parser.GeneratedParserUtilBase.*;
import com.intellij.psi.tree.IElementType;
import com.intellij.lang.ASTNode;
import com.intellij.psi.tree.TokenSet;
import com.intellij.lang.PsiParser;
import com.intellij.lang.LightPsiParser;

@SuppressWarnings({"SimplifiableIfStatement", "UnusedAssignment"})
public class UssParser implements PsiParser, LightPsiParser {

  public ASTNode parse(IElementType t, PsiBuilder b) {
    parseLight(t, b);
    return b.getTreeBuilt();
  }

  public void parseLight(IElementType t, PsiBuilder b) {
    boolean r;
    b = adapt_builder_(t, b, this, null);
    Marker m = enter_section_(b, 0, _COLLAPSE_, null);
    r = parse_root_(t, b);
    exit_section_(b, 0, m, t, r, true, TRUE_CONDITION);
  }

  protected boolean parse_root_(IElementType t, PsiBuilder b) {
    return parse_root_(t, b, 0);
  }

  static boolean parse_root_(IElementType t, PsiBuilder b, int l) {
    return ussFile(b, l + 1);
  }

  /* ********************************************************** */
  // COMMENT_EXPR
  public static boolean comment(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "comment")) return false;
    if (!nextTokenIs(b, COMMENT_EXPR)) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = consumeToken(b, COMMENT_EXPR);
    exit_section_(b, m, COMMENT, r);
    return r;
  }

  /* ********************************************************** */
  // comment | newline | token
  static boolean item_(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "item_")) return false;
    boolean r;
    r = comment(b, l + 1);
    if (!r) r = newline(b, l + 1);
    if (!r) r = token(b, l + 1);
    return r;
  }

  /* ********************************************************** */
  // ELEMENT_NAME | BINDING_NAME | BINDING_PROP
  public static boolean name_expr(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "name_expr")) return false;
    boolean r;
    Marker m = enter_section_(b, l, _NONE_, NAME_EXPR, "<name expr>");
    r = consumeToken(b, ELEMENT_NAME);
    if (!r) r = consumeToken(b, BINDING_NAME);
    if (!r) r = consumeToken(b, BINDING_PROP);
    exit_section_(b, l, m, r, false, null);
    return r;
  }

  /* ********************************************************** */
  // CRLF
  public static boolean newline(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "newline")) return false;
    if (!nextTokenIs(b, CRLF)) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = consumeToken(b, CRLF);
    exit_section_(b, m, NEWLINE, r);
    return r;
  }

  /* ********************************************************** */
  // SEPARATOR
  public static boolean separator_expr(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "separator_expr")) return false;
    if (!nextTokenIs(b, SEPARATOR)) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = consumeToken(b, SEPARATOR);
    exit_section_(b, m, SEPARATOR_EXPR, r);
    return r;
  }

  /* ********************************************************** */
  // ELEMENT | BLOCK | CSS | BINDING | IMPORT | CLASS | STYLE
  public static boolean service(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "service")) return false;
    boolean r;
    Marker m = enter_section_(b, l, _NONE_, SERVICE, "<service>");
    r = consumeToken(b, ELEMENT);
    if (!r) r = consumeToken(b, BLOCK);
    if (!r) r = consumeToken(b, CSS);
    if (!r) r = consumeToken(b, BINDING);
    if (!r) r = consumeToken(b, IMPORT);
    if (!r) r = consumeToken(b, CLASS);
    if (!r) r = consumeToken(b, STYLE);
    exit_section_(b, l, m, r, false, null);
    return r;
  }

  /* ********************************************************** */
  // L_PARENTHESIS({service|name_expr|token|separator_expr|word_expr|newline}+)R_PARENTHESIS | L_PARENTHESIS R_PARENTHESIS
  public static boolean token(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "token")) return false;
    if (!nextTokenIs(b, L_PARENTHESIS)) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = token_0(b, l + 1);
    if (!r) r = parseTokens(b, 0, L_PARENTHESIS, R_PARENTHESIS);
    exit_section_(b, m, TOKEN, r);
    return r;
  }

  // L_PARENTHESIS({service|name_expr|token|separator_expr|word_expr|newline}+)R_PARENTHESIS
  private static boolean token_0(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "token_0")) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = consumeToken(b, L_PARENTHESIS);
    r = r && token_0_1(b, l + 1);
    r = r && consumeToken(b, R_PARENTHESIS);
    exit_section_(b, m, null, r);
    return r;
  }

  // {service|name_expr|token|separator_expr|word_expr|newline}+
  private static boolean token_0_1(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "token_0_1")) return false;
    boolean r;
    Marker m = enter_section_(b);
    r = token_0_1_0(b, l + 1);
    while (r) {
      int c = current_position_(b);
      if (!token_0_1_0(b, l + 1)) break;
      if (!empty_element_parsed_guard_(b, "token_0_1", c)) break;
    }
    exit_section_(b, m, null, r);
    return r;
  }

  // service|name_expr|token|separator_expr|word_expr|newline
  private static boolean token_0_1_0(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "token_0_1_0")) return false;
    boolean r;
    r = service(b, l + 1);
    if (!r) r = name_expr(b, l + 1);
    if (!r) r = token(b, l + 1);
    if (!r) r = separator_expr(b, l + 1);
    if (!r) r = word_expr(b, l + 1);
    if (!r) r = newline(b, l + 1);
    return r;
  }

  /* ********************************************************** */
  // item_*
  static boolean ussFile(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "ussFile")) return false;
    while (true) {
      int c = current_position_(b);
      if (!item_(b, l + 1)) break;
      if (!empty_element_parsed_guard_(b, "ussFile", c)) break;
    }
    return true;
  }

  /* ********************************************************** */
  // (WORD | DOUBLE_QUOTE | EMPTY_TOKEN)+
  public static boolean word_expr(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "word_expr")) return false;
    boolean r;
    Marker m = enter_section_(b, l, _NONE_, WORD_EXPR, "<word expr>");
    r = word_expr_0(b, l + 1);
    while (r) {
      int c = current_position_(b);
      if (!word_expr_0(b, l + 1)) break;
      if (!empty_element_parsed_guard_(b, "word_expr", c)) break;
    }
    exit_section_(b, l, m, r, false, null);
    return r;
  }

  // WORD | DOUBLE_QUOTE | EMPTY_TOKEN
  private static boolean word_expr_0(PsiBuilder b, int l) {
    if (!recursion_guard_(b, l, "word_expr_0")) return false;
    boolean r;
    r = consumeToken(b, WORD);
    if (!r) r = consumeToken(b, DOUBLE_QUOTE);
    if (!r) r = consumeToken(b, EMPTY_TOKEN);
    return r;
  }

}
