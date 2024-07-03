;; Manual settings avoid custom-set-variable overwrite
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Base package and archive configuration
(require 'package)
(add-to-list 'package-archives
	     '("melpa", "https://stable.melpa.org/packages/")
	     t)

(setq package-selected-packages
      '(company ;
	consult ;
	magit ;
	marginalia ;
	vertico))

(package-install-selected-packages t)
(package-autoremove)

(require 'use-package)

;; Git integration
(use-package magit
  :commands magit)

;; Minibuffer improvements
(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode))

(use-package vertico
  :init (vertico-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

;; Completion
(use-package company
  :hook prog-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-line-numbers 'relative)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode nil)
 '(menu-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-current-line ((t (:inherit line-number :foreground "white" :underline t :weight bold)))))