;; Hooks managed outside of customize
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook (lambda ()
                              (interactive)
                              (delete-trailing-whitespace)
                              (indent-region (point-min) (point-max) nil)
                              (untabify (point-min) (point-max))))

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

;; Modeline
(setq custom-modeline/lhs " %@%+ %l,%c ")
(defun custom-modeline/rhs () (format-time-string " %T "))

(setq-default mode-line-format
              (list
               custom-modeline/lhs
               '(:eval (propertize " %b " 'face 'mode-line-buffer-id))
               `(vc-mode vc-mode " VC:None")
               '(:eval (custom-modeline/rhs))
               mode-line-end-spaces))

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
 '(line-number-current-line ((t (:inherit line-number :foreground "white" :underline t :weight bold))))
 '(mode-line ((t (:background "darkorange" :foreground "black" :box (:line-width (1 . -1) :style released-button)))))
 '(mode-line-buffer-id ((t (:background "grey20" :foreground "white" :weight bold)))))
