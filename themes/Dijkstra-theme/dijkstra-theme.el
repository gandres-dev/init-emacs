;; ---------------------------
;; Dijkstra: A dark blue color theme
;; Author: Guillermo Andres Urbano.
;; https://github.com/GuillermoGAndres/
;; ----------------------------

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme dijkstra
  "A dark blue color theme :)")

;; ;ver colores M-x list-faces-display
(custom-theme-set-variables
 'dijkstra
 '(linum-format "%4d") ;; insert a space between number
 '(fringe-mode 19)) ;; make both fringes 19 pixels wide

(let ((dijkstra-background      "#111928") ;; azul 7
      ;;(dijkstra-background      "#0C1A29")
      ;;(dijkstra-background      "#0d101e") ;; azul 1
      (dijkstra-foreground      "#ededed")
      (dijkstra-mid-gray        "#666666")
      (dijkstra-darker-gray     "#14191f")
      (dijkstra-white           "#FFFFFF")
      (dijkstra-off-white       "#F8F8F0")
      (dijkstra-yellow-white    "#FFE792")
      (dijkstra-light-gray-blue "#d0dfe6")
      (dijkstra-lightest-blue   "#effbff")
      (dijkstra-lighter-blue    "#748aa6")
      (dijkstra-light-blue      "#6ee2ff")
      (dijkstra-blue            "#324357")
      (dijkstra-mode-line-blue  "#1e2338")
      (dijkstra-modeI-line-blue "#0b0e18")
      ;;(dijkstra-yellow          "#F0DFAF")
      (dijkstra-dark-blue       "#183c66")
      (dijkstra-darker-blue     "#1b232c")
      (dijkstra-green           "#95cc5e"))
  (custom-theme-set-faces
   'dijkstra

   ;; ----------------- Frame stuff --------------------
   `(default ((t (:background ,dijkstra-background :foreground ,dijkstra-foreground))))

   `(cursor  ((t (:background ,dijkstra-off-white))))
   ;;Marcado de la linea actual si es que esta activado.
   `(hl-line ((t (:background ,dijkstra-mid-gray))))

   ;; --------------------Mode line --------------------
   ;;`(mode-line ((t (:box nil :foreground ,dijkstra-foreground :background ,dijkstra-dark-blue))))
   `(mode-line ((t (:box nil :background "#c0c0c0" :foreground "#000000"))))
   ;;'(mode-line ((t (:background "#1e2338" :foreground :box nil))))

   ;;`(mode-line-inactive ((t (:box nil :background ,dijkstra-mid-gray :foreground ,dijkstra-light-gray-blue))))
   `(mode-line-inactive ((t (:box nil :background ,dijkstra-mode-line-blue :foreground ,dijkstra-foreground))))
   ;;`(mode-line-inactive ((t (:box nil :background "#0b0e18" ))))


   ;; Dir-ed search prompt
   ;;`(minibuffer-prompt ((default (:foreground ,dijkstra-white))))
   ;;`(minibuffer-prompt ((default (:foreground "#FFC8AE")))) ;;  #FFBA99 or #FFC8AE-naranja
   `(minibuffer-prompt ((default (:foreground "#F0DFAF")))) ;;  Amarillo

   ;; Highlight region color
                                        ;`(region ((t (:foreground ,dijkstra-yellow-white :background ,dijkstra-darker-blue))))
   `(fringe ((t (:background ,dijkstra-background))))

   ;; ---------------- Code Highlighting ---------------
   ;; Builtin
   '(font-lock-builtin-face ((t (:foreground "#add8e6"))))

   ;; Comments
   '(font-lock-comment-face ((t (:foreground "#657e65" :slant italic))))
   '(font-lock-doc-face ((t (:foreground "#657e65")))) 

   ;; Function names
   '(font-lock-function-name-face ((t (:foreground "#e0e4d1"))))

   ;; Keywords
   '(font-lock-keyword-face ((t (:foreground "#689bde"))))

   ;; Strings
   '(font-lock-string-face ((t (:foreground "#e9bb9b")))) ;Cadenas naranja claro #edb0a0 or #D1907F

   ;; Variables
   '(font-lock-type-face ((t (:foreground "#F0DFAF"))))  ; amarillo

   ;; Constantes
   '(font-lock-constant-face ((t (:foreground "#9da599")))) ; orange


   '(font-lock-variable-name-face ((t (:foreground "#d6d6d6")))) ; color de la letra

   ;;Warning
   `(font-lock-warning-face ((t (:foreground "#F28B86" :bold t))))
   
   ;; ---------------------------Company ---------------------------------------------------------
   '(company-preview ((t (:background "#111928" :foreground "#848484"))))
   '(company-preview-common ((t (:inherit company-preview :foreground "#848484"))))
   '(company-tooltip-common ((t (:foreground "#C5C8C6")))) ;Color de las letras en coincidencia en pop
    ;;'(company-tooltip-common ((t (:foreground "#d6d6d6")))) ;Color de las letras en coincidencia en pop
   '(company-tooltip-selection ((t (:background "#373B41")))) ;Color de seleccion resaltado.
   '(company-tooltip ((t (:background "#111928" :foreground "#848484")))) ;Color fondo y letra

   '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
   '(company-scrollbar-fg ((t (:background "#373B41"))))
   '(company-tooltip-annotation ((t (:foreground "#F0DFAF"))))

   ;; ----------------------------Helm-----------------------------------------
   '(helm-source-header ((t (:extend t :foreground "#F0DFAF" :weight bold))))
   '(helm-match ((t (:extend t :foreground "#F0DFAF"))))
   '(helm-selection ((t (:extend t :background "gray37" :distant-foreground "black"))))

   '(helm-ff-directory ((t (:extend t :foreground "#F0DFAF"))))
   '(helm-ff-dotted-directory ((t (:extend t :foreground "#d6d6d6"))))

   ;; --------------------------Tabs-------------------------------------
                                        ; Buen color naranja: #e9967a
   '(tab-bar ((t (:inherit variable-pitch :background "#0C1A29" :foreground "#F0DFAF"))))
   '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "#0C1A29" :foreground "#d6d6d6"))))

   ;; -------------------------Highlight region color-----------------------------------

   ;; --------------------linum-mode --------------------------------
   ;;'(linum ((t (:inherit (shadow default) :background "#0d101e" :foreground "#F0DFAF")))) ;Lineas amarillas
   ;;'(linum ((t (:inherit (shadow default) :background ,dijkstra-background :foreground ,dijkstra-yellow)))) ;Lineas amarillas

   ;;'(linum ((t (:inherit (shadow default) :background "#13182D" :foreground "#B3B3B3")))) ;Lineas grises
   '(linum ((t (:inherit (shadow default) :background "#111928" :foreground "#4a4a4a")))) ;Lineas grises
   ;; Gano el grey29: #4a4a4a , con este color de numero, automaticamente se carga una sombra con marcar.
   ;; Gris muy plateado este grey59: #969696

   ;;-------------------- display-line-numbers-mode--- (otra modo como linum-mode, la diferencia puede resaltar el marcado linea actual)------
   ;;'(line-number ((t (:inherit (shadow default) :foreground "#4a4a4a")))) ;; letras frises
   '(line-number ((t (:inherit (shadow default) :foreground "#656666")))) ;; letras grises

   ;; Sin background
   ;;'(line-number-current-line ((t (:inherit line-number :foreground "#b5b5b5"))))

   ;; Con background
   '(line-number-current-line ((t (:inherit line-number :background "#373B41" :foreground "#F6F3E8")))) ;; Con background
   
   ;; ----------- treemacs ----------------------------
   '(treemacs-fringe-indicator-face ((t (:foreground "#86B187"))))
   ;;'(region ((t (:foreground ,hoare-light-yellow :background "gray37"))))
   '(region ((t (:background "#373B41"))))

   ;; ---------------- Package Specific Stuff -----------
   ;; Powerlinec
   `(powerline-active1 ((t (:background ,dijkstra-off-white :foreground ,dijkstra-background))))

   ;;--------------------Web mode --------------------
   '(web-mode-doctype-face ((t (:foreground "lightblue")))) ;turquoise , lightblue, PaleTurquoise
   '(web-mode-html-tag-face ((t (:foreground "#398ecc")))); azul marino #398ecc
   '(web-mode-html-attr-name-face ((t (:foreground "#fff4cc")))) ; amarillo muy claro
   '(web-mode-html-attr-value-face ((t (:foreground "#edb0a0")))) ; naranja claro

   
   ;; '(web-mode-html-tag-face ((t (:foreground "#8AC6F2")))); azul
   ;;'(web-mode-html-tag-face ((t (:foreground "#FFF8DC")))); amarillo
   ;;'(web-mode-html-tag-face ((t (:foreground "#EFFBFF"))));Color de los brackets
   ;;'(web-mode-html-attr-name-face ((t (:foreground "#FFDAB5")))) ; naranja muy claro
   ;;'(web-mode-html-attr-name-face ((t (:foreground "#FFF8DC")))) ; amarillo claro
   ;;'(web-mode-html-attr-name-face ((t (:foreground "lightblue")))) ; azul-claro   
   ;;'(web-mode-html-attr-name-face ((t (:foreground "#BCEDDE")))) ;verde claro
   ;;'(web-mode-html-attr-value-face ((t (:foreground "#D1907F")))) ; naranja fuerte
   ;;'(web-mode-html-attr-value-face ((t (:foreground "#deaece")))) ; rosa fuerte
   ;;'(web-mode-html-attr-value-face ((t (:foreground "#e3bcd6")))) ; rosa claro
   ;;'(web-mode-comment-face ((t (:foreground "#EFFBFF")))) ;; Color blanco

   ;;----------------------JS2-mode------------------------------------
   '(js2-error ((t (:foreground "#ed5f70" :slant italic :weight semi-bold))))
   '(js2-warning ((t (:underline (:color "#EB9490" :style wave) :slant italic))))
   ;;'(js2-object-property ((t (:foreground "#FFDAB5")))) ; naranja claro
   '(js2-object-property ((t (:foreground "#d6d6d6" :slant italic)))) ; letra normal
   '(js2-function-call ((t (:foreground "#fff4cc")))) ; amarillo
   '(js2-external-variable ((t (:foreground "#FFDAB5")))) ; naranja claro
   '(js2-function-param ((t (:foreground "#d6d6d6")))) ;; color de la letra normal

   ;;--------------------diredfl------------------------------
   '(diredfl-date-time ((t (:foreground "#b8c4d7"))))
   '(diredfl-dir-heading ((t (:foreground "#ceeca4"))))
   '(diredfl-dir-name ((t (:foreground "#F0DFAF"))))
   '(diredfl-dir-priv ((t (:foreground "#96e7e5"))))
   '(diredfl-exec-priv ((t (:foreground "#D1907F"))))
   '(diredfl-file-name ((t nil)))
   '(diredfl-file-suffix ((t (:inherit diredfl-file-name))))
   '(diredfl-no-priv ((t nil)))
   '(diredfl-number ((t (:foreground "#F0DFAF"))))
   '(diredfl-read-priv ((t (:foreground "#ceeca4"))))
   '(diredfl-symlink ((t (:foreground "#96e7e5"))))
   '(diredfl-write-priv ((t (:foreground "#F0DFAF"))))

   )
  )


;;;###Autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name)))
  (when (not window-system)
    (custom-set-faces '(default ((t (:background nil)))))))

(provide-theme 'dijkstra)

;; Local Variables:
;; no-byte-compile: t
;; End:
