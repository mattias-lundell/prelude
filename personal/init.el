;; disable prelude autostarts
(defun disable-guru-mode ()
  (guru-mode -1))

(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)
(add-hook 'prog-mode-hook 'whitespace-turn-off t)
(disable-theme 'zenburn)

;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-20120922.1815/")
(require 'auto-complete-config)
(ac-flyspell-workaround)
(ac-config-default)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "/tmp/\\1" t)))
 '(backup-directory-alist '((".*" . "/tmp/"))))

;; navigate open frames
(global-set-key [M-left] 'windmove-left)          ; move to left   window
(global-set-key [M-right] 'windmove-right)        ; move to right  window
(global-set-key [M-up] 'windmove-up)              ; move to upper  window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

;; visual settings
(add-to-list 'default-frame-alist '(font . "Inconsolata-10"))
(load-theme 'solarized-dark t)
(set-scroll-bar-mode nil)

;; Prevent Emacs from extending file when
;; pressing down arrow at end of buffer.
(setq next-line-add-newlines nil)
;; Silently ensure newline at end of file
(setq require-final-newline t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; set xetex mode in tex/latex
(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query nil)
                             (setq TeX-show-compilation t)))
