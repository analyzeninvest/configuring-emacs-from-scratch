
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org)
(org-babel-load-file (expand-file-name "settings.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" default)))
 '(magit-dispatch-arguments nil)
 '(package-selected-packages
   (quote
    (langtool flycheck flyspell-correct-ivy highlight-indent-guides yasnippet-snippets company-anaconda trr yasnippet company-quickhelp company paredit iedit magit counsel-projectile counsel ivy org-bullets cycle-themes dracula-theme exotica-theme ido-grid-mode ido-describe-bindings))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
