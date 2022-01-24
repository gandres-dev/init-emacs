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
  (global-company-mode)
  :bind
  ;(("<C-return>" . company-complete))
  (("<C-M-return>" . company-complete))
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



(use-package expand-region
  :ensure t
  :config
  ;(global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "s-SPC") 'er/expand-region)
  )
