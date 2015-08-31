(require 'cask "/usr/local/Cellar/cask/0.7.2_1/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; disable splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; load theme, fonts, disable menu and scroll
(load-theme 'material t)
(set-frame-font "Source Code Pro for Powerline-16")
(setq-default line-spacing 10)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(setq c-basic-offset 2)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; yasnippet settings
(yas-global-mode 1)

;; company mode config
(add-hook 'after-init-hook 'global-company-mode)

;; auto-complete config
(ac-config-default)

;; smartparens config
(smartparens-global-mode t)

;; evil mode config
(evil-mode 1)

;; powerline config
(powerline-default-theme)

;; neotree config
(global-set-key [f8] 'neotree-toggle)

;; projectile config
(projectile-global-mode)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)

;; web mode config
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; php mode config
(add-hook 'php-mode-hook
	  '(lambda()
	    (setq tab-width 2)
	    (setq indent-tabs-mode nil)
	    (setq c-basic-offset 2)
	  ))

;; emmet mode config
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;; multiple cursors config
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; alchemist mode config
(setq alchemist-iex-program-name "/usr/local/bin/iex")
(setq alchemist-key-command-prefix (kbd "C-c ,"))

;; exec path from shell config
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
