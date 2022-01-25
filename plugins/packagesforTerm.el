(require 'use-package)
;; Con esto ya no sera necesarop poner :ensure t
(setq use-package-always-ensure t)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; ivy no instala counsel, se debe instalar a parte
(use-package ivy
  :diminish  
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill))
  :init
  (ivy-mode 1))


;; Una vez instalado counsel, se puede instalar ivy-rich, ademas tambien instala swiper
;; Con M-o te da un menu de opciones en counse-M-x
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))


;; Funciona cuando es activado counsel-M-x fuction
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  :bind
  ;(("<C-return>" . company-complete))
  (("<C-M-return>" . company-complete))
  )


(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  
  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous)
  )


(use-package multiple-cursors
   :ensure t
   :bind 
   (("C-c C-m" . mc/edit-lines))
   (("C->" . mc/mark-next-like-this))
   (("C-<" . mc/mark-previous-like-this))
   (("<M-S-down>" . mc/mark-next-like-this)) ;; no funciona bien con org mode
   (("<M-S-up>" . mc/mark-previous-like-this)) ;; por tambien active las de arriba
   (("C-S-l" . 'mc/mark-all-dwim))
   ;;(("C-c C-<" . 'mc/mark-all-like-this))
   ;;(("C-c C-a" . mc/skip-to-previous-like-this))
   (("C-M-}" . mc/skip-to-next-like-this))
   (("C-M-{" . mc/skip-to-previous-like-this))
   (("s-}" . mc/unmark-previous-like-this))
   (("s-{" . mc/unmark-next-like-this))
   ;;(("C-c C-M-{" . mc/mark-all-dwim))
   (("C-c C-M-}" . mc/mark-all-in-region))
   (("C-M-<mouse-1>" . mc/add-cursor-on-click))    
   (("C-c C-r" . mc/mark-sgml-tag-pair))
   )


(use-package highlight-numbers
:ensure t
:init
(add-hook 'prog-mode-hook 'highlight-numbers-mode) 
)

(use-package emmet-mode
  :ensure t
  :hook ((html-mode       . emmet-mode)
         (css-mode        . emmet-mode)
         (web-mode        . emmet-mode)
         ;; (sgml-mode       . emmet-mode) ;Auto-start on any markup modes
         ;; (js-mode         . emmet-mode)
         ;; (js-jsx-mode     . emmet-mode) ; Tiene que ver con react
         ;; (typescript-mode . emmet-mode)
         )
  :config
  ;;(setq emmet-insert-flash-time 0.001) ; effectively disabling it
  (define-key emmet-mode-keymap (kbd "<C-return>") 'open-line-below)
  (define-key emmet-mode-keymap (kbd "C-.") 'emmet-expand-line)

  )


(add-hook 'prog-mode-hook 'auto-fill-mode) ;; Rompe las lineas cuando son muy grandes.
;;(add-hook 'prog-mode-hook 'linum-mode) ;; Agrega numero de lineas
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; Agrega numero de lineas (mejorado)
(global-set-key [remap describe-function] 'counsel-describe-function)
(global-set-key [remap describe-variable] 'counsel-describe-variable)
(global-set-key (kbd "C-'") 'isearch-forward)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-x <up>") 'counsel-imenu)
(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)
(global-set-key (kbd "C-M-k") 'counsel-switch-buffer)
(global-set-key (kbd "C-M-j") 'counsel-ibuffer)
(global-set-key (kbd "C-M-l") 'next-buffer)
(global-set-key (kbd "C-M-h") 'previous-buffer)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(js2-mode yasnippet which-key web-mode use-package s rainbow-delimiters pyvenv popwin nyan-mode multiple-cursors magit ivy-rich highlight-numbers highlight-indentation expand-region emmet-mode diredfl dired-git-info counsel company-web company-quickhelp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
