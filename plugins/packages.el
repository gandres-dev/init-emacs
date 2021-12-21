
(require 'use-package)
;; Con esto ya no sera necesarop poner :ensure t
(setq use-package-always-ensure t)


  
; Quita el echo de shell
(defun my-shell-turn-echo-off ()
  (setq comint-process-echoes t))
(add-hook 'shell-mode-hook 'my-shell-turn-echo-off)


(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
        '(
          "~/.emacs.d/snippets"
          ))
  ;; Modo en general (Modo mayor)
  ;;(yas-global-mode 1)
  ;; Para un modo en expecifico (modo menor)
  (yas-reload-all)
  (add-hook 'c-mode-hook #'yas-minor-mode)
  (add-hook 'c++-mode-hook #'yas-minor-mode)
  (add-hook 'java-mode-hook #'yas-minor-mode)
  (add-hook 'org-mode-hook #'yas-minor-mode)
  (add-hook 'python-mode-hook #'yas-minor-mode)
  ;; (add-hook 'prog-mode-hook #'yas-minor-mode)  
)


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

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


(use-package popwin
  :ensure t
  :init
  (popwin-mode 1)
)

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

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode)
)

(use-package highlight-numbers
:ensure t
:init
(add-hook 'prog-mode-hook 'highlight-numbers-mode) 
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


;Modifica los espacion 4 for C/C++
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;Agrega color a la s secuencas de escape
(defface my-backslash-escape-backslash-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the back-slash component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-backslash-escape-char-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the charcter component of a back-slash escape."
  :group 'font-lock-faces)

(defface my-format-code-format-face
  '((t :inherit font-lock-regexp-grouping-backslash))
  "Face for the % component of a printf format code."
  :group 'font-lock-faces)

(defface my-format-code-directive-face
  '((t :inherit font-lock-regexp-grouping-construct))
  "Face for the directive component of a printf format code."
  :group 'font-lock-faces)


(font-lock-add-keywords 'c-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'java-mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(font-lock-add-keywords 'c++mode
   '(("\\(\\\\\\)." 1 'my-backslash-escape-backslash-face prepend)
     ("\\\\\\(.\\)" 1 'my-backslash-escape-char-face      prepend)
     ("\\(%\\)."    1 'my-format-code-format-face         prepend)
     ("%\\(.\\)"    1 'my-format-code-directive-face      prepend)))

(use-package nyan-mode
  :ensure t
  ;;:config
  ;;(nyan-mode)
  )

(use-package magit
  :ensure t  
  )

(use-package web-mode
  :ensure t
  :mode (
         ("\\.html?\\'" . web-mode)
         ("\\.css\\'"   . web-mode)
         ("\\.php\\'"   . web-mode)
         ;;("\\.js\\'"    . web-mode)
         ;;("\\.tsx?\\'"  . web-mode)
         ;;("\\.json\\'"  . web-mode)
         )
  :config
  (defun html-close-element ()
    (interactive)
    (web-mode-element-close)
    (indent-region (point-min) (point-max))
    (open-line-below)
    )

  ;; Selecciona el contenido de la etiqueta
  (defun select-tag-content-element ()
    (interactive)
    (web-mode-tag-previous)
    (web-mode-tag-end)
    (set-mark-command (push-mark))
    (web-mode-tag-next)
    )


  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    ;; HTML
    (setq web-mode-markup-indent-offset 2)
    ;; CSS
    (setq web-mode-css-indent-offset 2)
    ;; Script/code offset indentation (for JavaScript, Java, PHP, Ruby, Go, VBScript, Python, etc.)
    (setq web-mode-code-indent-offset 2)
    ;;(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

    ;; Example: (define-key web-mode-map (kbd "C-c n") 'web-mode-buffer-indent)
    ;; (define-key web-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair) como es web mode no sabe indentificar etiquetas como sgml-mode (aqui no funciona).

    (define-key web-mode-map (kbd "C-,") 'html-close-element)
    (define-key web-mode-map (kbd "C-c C-o") 'browse-url-of-file)

    ;; Select content element
    (define-key web-mode-map (kbd "C-c o") 'select-tag-content-element)
    ;; Definiendo tambien con Prefijos C-c C-e
    (define-key web-mode-map (kbd "C-c C-e C-c") 'select-tag-content-element)
    ;;(define-key web-mode-map (kbd "C-c C-e o") 'select-tag-content-element)


    ;;Company backends
    ;; https://github.com/company-mode/company-mode/issues/839
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files company-capf company-dabbrev-code))
    )

  (add-hook 'web-mode-hook  'my-web-mode-hook)

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

(use-package company-web
  :ensure t
  :config

  (defun my-web-mode-hook ()
    "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-css company-web-html company-yasnippet company-files))

    ;; manual autocomplete
    (define-key web-mode-map (kbd "M-RET") 'company-complete)

    ;; Enable JavaScript completion between <script>...</script> etc.
    (advice-add 'company-tern :before
                #'(lambda (&rest _)
                    (if (equal major-mode 'web-mode)
                        (let ((web-mode-cur-language
                               (web-mode-language-at-pos)))
                          (if (or (string= web-mode-cur-language "javascript")
                                  (string= web-mode-cur-language "jsx"))
                              (unless tern-mode (tern-mode))
                            (if tern-mode (tern-mode -1)))))))

    )

  (add-hook 'web-mode-hook 'my-web-mode-hook)  

  )

(use-package expand-region
  :ensure t
  :config
  ;(global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "s-SPC") 'er/expand-region)
  )


;; Colourful columns.
(use-package diredfl
  :ensure t
  :config
  (diredfl-global-mode 1))

;; Descripcion de los commit en dired-mode
(use-package dired-git-info
    :ensure t
    :bind (:map dired-mode-map
                (")" . dired-git-info-mode)))


