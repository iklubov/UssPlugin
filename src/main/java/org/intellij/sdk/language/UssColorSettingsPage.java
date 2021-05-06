package org.intellij.sdk.language;

import com.intellij.openapi.editor.DefaultLanguageHighlighterColors;
import com.intellij.openapi.editor.HighlighterColors;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighter;
import com.intellij.openapi.options.colors.AttributesDescriptor;
import com.intellij.openapi.options.colors.ColorDescriptor;
import com.intellij.openapi.options.colors.ColorSettingsPage;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.util.Map;

public class UssColorSettingsPage implements ColorSettingsPage {

    private static final AttributesDescriptor[] DESCRIPTORS = new AttributesDescriptor[]{

            new AttributesDescriptor("Element", UssSyntaxHighlighter.ELEMENT),
            new AttributesDescriptor("Element name", UssSyntaxHighlighter.ELEMENT_NAME),
            new AttributesDescriptor("Block", UssSyntaxHighlighter.BLOCK),
            new AttributesDescriptor("Style", UssSyntaxHighlighter.STYLE),
            new AttributesDescriptor("Style params", UssSyntaxHighlighter.STYLE_PARAMS),
            new AttributesDescriptor("Binding", UssSyntaxHighlighter.BINDING),
            new AttributesDescriptor("Binding name", UssSyntaxHighlighter.BINDING_PARAMS),
            new AttributesDescriptor("Class", UssSyntaxHighlighter.CLASS),
            new AttributesDescriptor("Css", UssSyntaxHighlighter.CSS),
            new AttributesDescriptor("Replace", UssSyntaxHighlighter.REPLACE),
            new AttributesDescriptor("Separator", UssSyntaxHighlighter.SEPARATOR),
            new AttributesDescriptor("Comment", UssSyntaxHighlighter.COMMENT),
            new AttributesDescriptor("Bad Value", UssSyntaxHighlighter.BAD_CHARACTER)
    };

    @Nullable
    @Override
    public Icon
    getIcon() {
        return UssIcon.FILE;
    }

    @NotNull
    @Override
    public SyntaxHighlighter getHighlighter() {
        return new UssSyntaxHighlighter();
    }

    @NotNull
    @Override
    public String getDemoText() {
        return "###################HEADER####################HEADER####################HEADER##################\n" +
                "(css $ItemListAchievementMargins ()\n" +
                "\t(marginRight 12px)\n" +
                "\t(marginLeft 12px)\n" +
                "\t(marginBottom 24px)\n" +
                ")\n" +
                "(element AchievementAppearAnimation()\n" +
                "\t(bind appear \"'addedToStage'; (_animationOn ? 0.15 : 0 ); (_animationOn ? (0.15 * $index + _delay) : 0); {alpha: 0, top: 10}; {alpha: 1, top: 0}\")\n" +
                "\t(block\n" +
                "\t\t(style (marginRight 26px))\n" +
                "\t\t(bind instance \"'AchievementIcon'; {_id: id, _amount: amount, _size: '56px', _progressWidth: '44px', _showProgress: true}\")\n" +
                "\t)\n" +
                ")\n";
    }

    @Nullable
    @Override
    public Map<String, TextAttributesKey> getAdditionalHighlightingTagToDescriptorMap() {
        return null;
    }

    @NotNull
    @Override
    public AttributesDescriptor[] getAttributeDescriptors() {
        return DESCRIPTORS;
    }

    @NotNull
    @Override
    public ColorDescriptor[] getColorDescriptors() {
        return ColorDescriptor.EMPTY_ARRAY;
    }

    @NotNull
    @Override
    public String getDisplayName() {
        return "Uss";
    }

}
