;;; MELPA package repository https://melpa.org/#/getting-started

;; https://medium.com/@FrancoPasut/emacs-melpa-and-the-failed-to-download-gnu-archive-error-b834bbe4491e
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")



(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))

  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install `use-package))


;; Load myinit.org
(org-babel-load-file (expand-file-name "~/.emacs.d/configuration.org"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (irony flycheck-rtags rtags flycheck-clang-analyzer markdown-mode xcscope org-jira json-mode lua-mode yaml-mode dockerfile-mode fish-mode yasnippet-snippets which-key use-package try solarized-theme pdf-tools org-bullets magit lorem-ipsum ledger-mode jedi iedit flycheck-ledger ess-smart-underscore ess-R-data-view emojify elpy doom-themes counsel auctex ace-window)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0))))
 '(trailing-whitespace ((t (:background "orange red")))))
