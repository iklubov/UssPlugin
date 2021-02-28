package org.intellij.sdk.language;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.PsiManager;
import com.intellij.psi.search.FileTypeIndex;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.psi.util.PsiTreeUtil;
import org.intellij.sdk.language.psi.UssFile;
import org.intellij.sdk.language.psi.UssToken;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class UssUtil {
    /**
     * Searches the entire project for Simple language files with instances of the Simple property with the given key.
     *
     * @param project current project
     * @param key     to check
     * @return matching properties
     */
    public static List<UssToken> findProperties(Project project, String key) {
        List<UssToken> result = new ArrayList<>();
        Collection<VirtualFile> virtualFiles =
                FileTypeIndex.getFiles(UssFileType.INSTANCE, GlobalSearchScope.allScope(project));
        for (VirtualFile virtualFile : virtualFiles) {
            UssFile simpleFile = (UssFile) PsiManager.getInstance(project).findFile(virtualFile);
            if (simpleFile != null) {
                UssToken[] properties = PsiTreeUtil.getChildrenOfType(simpleFile, UssToken.class);
                if (properties != null) {
                    for (UssToken property : properties) {
                        //if (key.equals(property.getKey())) {
                        if (true) {
                            result.add(property);
                        }
                    }
                }
            }
        }
        return result;
    }

    public static List<UssToken> findProperties(Project project) {
        List<UssToken> result = new ArrayList<>();
        Collection<VirtualFile> virtualFiles =
                FileTypeIndex.getFiles(UssFileType.INSTANCE, GlobalSearchScope.allScope(project));
        for (VirtualFile virtualFile : virtualFiles) {
            UssFile simpleFile = (UssFile) PsiManager.getInstance(project).findFile(virtualFile);
            if (simpleFile != null) {
                UssToken[] properties = PsiTreeUtil.getChildrenOfType(simpleFile, UssToken.class);
                if (properties != null) {
                    Collections.addAll(result, properties);
                }
            }
        }
        return result;
    }
}
