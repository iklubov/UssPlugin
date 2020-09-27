// Copyright 2000-2020 JetBrains s.r.o. and other contributors. Use of this source code is governed by the Apache 2.0 license that can be found in the LICENSE file.


import com.intellij.lexer.FlexAdapter;
import org.intellij.sdk.language.UssLexer;


public class UssLexerAdapter extends FlexAdapter {

  public UssLexerAdapter() {
    super(new UssLexer(null));
  }

}
