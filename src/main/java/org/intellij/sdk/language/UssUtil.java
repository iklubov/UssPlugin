package org.intellij.sdk.language;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.PsiManager;
import com.intellij.psi.search.FileTypeIndex;
import com.intellij.psi.search.GlobalSearchScope;
import com.intellij.psi.util.PsiTreeUtil;
import org.intellij.sdk.language.psi.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class UssUtil {
    /**
     * Searches the entire project for Uss language files with instances of the Uss property with the given key.
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
            UssFile ussFile = (UssFile) PsiManager.getInstance(project).findFile(virtualFile);
            if (ussFile != null) {
                UssToken[] properties = PsiTreeUtil.getChildrenOfType(ussFile, UssToken.class);
                if (properties != null) {
                    for (UssToken property : properties) {
                        //if (key.equals(property.getKey())) {
                        // to do
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
            UssFile ussFile = (UssFile) PsiManager.getInstance(project).findFile(virtualFile);
            if (ussFile != null) {
                UssToken[] properties = PsiTreeUtil.getChildrenOfType(ussFile, UssToken.class);
                if (properties != null) {
                    Collections.addAll(result, properties);
                }
            }
        }
        return result;
    }
}
