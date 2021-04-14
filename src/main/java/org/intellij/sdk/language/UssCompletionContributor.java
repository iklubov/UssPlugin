package org.intellij.sdk.language;

import com.intellij.codeInsight.completion.*;
import com.intellij.codeInsight.lookup.LookupElementBuilder;
import com.intellij.patterns.PlatformPatterns;
import com.intellij.util.ProcessingContext;
import org.intellij.sdk.language.psi.UssTypes;
import org.jetbrains.annotations.NotNull;

public class UssCompletionContributor extends CompletionContributor {

    public String[] bindings = {"controller","child","childParentScope","instance","event","dispatch","dispatchDelayReset","style","class","sync","repeat","repeatCache","repeatObject","dataRefDH","watchDH","entityDH"
            ,"firstEntityDH","handleEventDH","fxInstance","mrMeeseeks","collectionDH","collectionDHById","collectionRepeatDH","collectionDesign","collectionFields","primaryEntityDH","clikList","draggableWindow"
            ,"draggable","droppable","resize","appear","fade","transition","timestampTween","textCountdown","pluralText","tooltip","popup","popupNoCache","menu","blurLayer","blurMap","request","action","focus","sequence"
            ,"feature","catch","catchProperty","var","watch","actionIsDisplay","scopeHoldRepeat","substitute","scopeTrace","changeDispatch","countdown","file","imeEnable","linearChart","eventSequence","contains","levelToFeature"
            ,"timeFormat","serverTime","generator","generatorDH","clock","inoutAction","soundOn","blockSize","stageCoord","scrollController","scrollControllerCentered","catchDH","keyboard","debugWrite","debugRead"
            ,"debugReadAll","debugSend","debugReceive","debugRewrite","debugTypeOf","debugScope","debugDataProvider","debugBlockInfo","debugScopeDraw","concat","colorTransform","clipboard","resource","slice","mc","objectUnderPoint"
            ,"restrictFeedback","perFrameUpdate","indexOf","atlasText","timeline","battleHint","lag","makeScreenshot","directEvent","visible"};
    public UssCompletionContributor() {
        // first iteration, because  parameters.getPosition() returns wrong token types sometimes
        // but it works for binding prop so we have hardcode here yet
        extend(CompletionType.BASIC, PlatformPatterns.psiElement(UssTypes.BINDING_PROP),
                new CompletionProvider<CompletionParameters>() {
                    public void addCompletions(@NotNull CompletionParameters parameters,
                                               @NotNull ProcessingContext context,
                                               @NotNull CompletionResultSet resultSet) {
                        for (String bind : bindings)
                            resultSet.addElement(LookupElementBuilder.create(bind));
                    }
                }
        );
    }

    @Override
    public void fillCompletionVariants(@NotNull CompletionParameters parameters, @NotNull CompletionResultSet result) {
        super.fillCompletionVariants(parameters, result);
        //System.out.println(parameters.getPosition());
    }
}
