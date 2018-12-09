(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/" ) t)
(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/" ) t)
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;(toggle-frame-maximized) ;;; not using this one any more as each time init.el is eavluated, frame is toggled
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(global-linum-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(display-time-mode 1)
(display-battery-mode 1)
(setq column-number-mode t)
(global-hl-line-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(savehist-mode 1)
(global-auto-revert-mode 1)
(global-visual-line-mode 1)
(size-indication-mode 1)
(set-language-environment "UTF-8")

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extension-order '(".org" ".txt" ".csv"))

(winner-mode 1)

(electric-indent-mode 1)

(add-hook 'prog-mode-hook (lambda () (hs-minor-mode 1)))
(global-set-key (kbd "C-c @ @") 'hs-hide-all)
(global-set-key (kbd "C-c @ h") 'hs-hide-block)
(global-set-key (kbd "C-c @ s") 'hs-show-block)
(global-set-key (kbd "C-c @ SPC") 'hs-show-all)

(add-to-list 'org-export-backends 'taskjuggler)

(ido-grid-mode 1)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
;(global-set-key (kbd "C-x C-f") 'counsel-find-file) ;;; keep IDO mode for find file
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(require 'magit)

(require 'iedit)

(require 'paredit)
(paredit-mode 1)
(global-set-key (kbd "C-<left>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-M-<left>") 'paredit-backward-slurp-sexp)
(global-set-key (kbd "C-<right>") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-M-<right>") 'paredit-backward-barf-sexp)
(global-set-key (kbd "M-S") 'paredit-split-sexp)
(global-set-key (kbd "M-J") 'paredit-join-sexps)

(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)

(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0)

(add-hook 'python-mode-hook 'anaconda-mode)

(require 'rx)
(eval-after-load "company" 
'(add-to-list 'company-backends 'company-anaconda))

(require 'yasnippet)
(yas-global-mode 1)
  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

  (global-set-key (kbd "M-z") 'tab-indent-or-complete)

(require 'highlight-indent-guides)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)

(global-set-key (kbd "C-?") 'hippie-expand)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "DEL") 'backward-delete-char)
(global-set-key (kbd "C-z") 'replace-string)
(global-set-key (kbd "C-M-z") 'replace-regex)
(global-set-key (kbd "C-Z") 'count-matches)

(load-theme 'exotica t)
