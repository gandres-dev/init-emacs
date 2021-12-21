;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ---------------------------
;; Church: An dark color theme
;; Author: Guillermo Andres Urbano.
;; https://github.com/GuillermoGAndres/
;; ----------------------------

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme church
  "An cool dark color theme :D")

(let ((church-background      "#141414")
      (church-background2     "#1e1d1e")
      (church-foreground      "#ededed")
      (church-mid-gray        "#666666")
      (church-black           "#0B0B0B")
      (church-white           "#FFFFFF")
      (church-off-white       "#F8F8F0")
      (church-light-gray-blue "#d0dfe6")
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (church-light-blue     "#A4D1F2")
      (church-comment-white     "#EFFBFF")
      (church-light-yellow    "#FFF8DC")
      (church-light-purple    "#CAB4CC")
      (church-light-green    "#BCEDDE")
      (church-light-orange    "#FFDAB5")
      (church-region-yellow    "#FFFDD5")
      (church-region-letter    "#525252")
      (church-linum-yellow    "#F3EFDE")
      (church-mode-line-inact      "#323232")
      (church-mode-line-black      "#272727")
      (church-mode-line-white      "#cacaca")
      )

  (custom-theme-set-faces
   'church

   ;; ----------------- Frame stuff --------------------
   `(default ((t (:background ,church-background2 :foreground ,church-foreground))))
   `(cursor  ((t (:background ,church-light-blue))))
   ;; `(cursor  ((t (:background "#FFF8DC")))) amarillo
   
   ;;Marcado de la linea actual si es que esta activado.
   ;; `(hl-line ((t (:background ,church-mid-gray))))
   ;; `(hl-line ((t (:background "#3c3f42"))))
   `(hl-line ((t (:background "#2b2b2b"))))
   
   ;;------------------------Mode-line------------------------------
   `(mode-line-inactive ((t (:box nil :background ,church-background :foreground ,church-foreground))))
   `(mode-line ((t (:box nil :foreground ,church-foreground :background ,church-mode-line-black))))
   ;;`(mode-line ((t (:box nil :foreground "#010001" :background "#c0c0c0")))) ;; or #cdcdcd
   '(mode-line-buffer-id ((t (:weight semibold))))

   ;;-------------------- Dir-ed search prompt --------------------
   ;; '(minibuffer-prompt ((t (:foreground "#8ce7cc")))) ;; verdeagua
   '(minibuffer-prompt ((t (:foreground "#A4D1F2")))) ;; azul
   
   ;; --------------------Highlight region color ------------------------------
   ;;`(region ((t (:foreground ,church-region-letter :background ,church-region-yellow))))
   ;;`(region ((t (:foreground "#EFFBFF" :background "#1b3552")))) ;; Region azul
   ;; `(region ((t (:foreground "#ffffff" :background "#5e5e5e")))) ;; Region gris37
   ;; `(region ((t (:background "#5e5e5e")))) ;; Region gris37
   '(region ((t (:background "#3c3f42")))) ;; cool
   

   ;; ---------------- Code Highlighting ----------------------------------------------

   ;; Builtin-faces
   '(font-lock-builtin-face ((t (:foreground "#A4D1F2")))) ;

   ;; Comments
   ;; '(font-lock-comment-face ((t (:foreground "#616161" :slant italic)))) ;
   '(font-lock-comment-face ((t (:foreground "#8b8988" :slant italic)))) ;; more stronger

   ;; Constant
   '(font-lock-constant-face ((t (:foreground "#CAB4CC")))) ;Constantes:

   ;;Doctring
   ;;'(font-lock-doc-face ((t (:foreground "#F4B3A0")))) ;Docsting naranja
   '(font-lock-doc-face ((t (:foreground "#86B187")))) ;Docsting verde

   ;; Function names
   '(font-lock-function-name-face ((t (:foreground "#A4D1F2")))) ;Funcion names:

   ;; Keywords
   '(font-lock-keyword-face ((t (:foreground "#FFF8DC")))) ; keyword;

   ;; Preprocessor
   ;;'(font-lock-preprocessor-face ((t (:foreground "dark slate blue"))))
   '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))

   ;; Strings
   '(font-lock-string-face ((t (:foreground "#F4B3A0")))) ;Cadenas;

   ;; Variables
   '(font-lock-variable-name-face ((t (:foreground "#BCEDDE")))) ;Color:
   ;;'(font-lock-type-face ((t (:foreground "#fff2c0")))) ; Clases y types:
   '(font-lock-type-face ((t (:inherit (font-lock-keyword-face))))) ; Clases y types:

   ;; Warning
   '(font-lock-warning-face ((t (:foreground "pink"))))

   ;;fringe
   `(fringe ((t (:background ,church-background2))))

   ;; show-parent-match
   ;;'(show-paren-match ((t (:foreground "#1ead05"))))

   ;;------------------------------ Highlight linum color------------------------------
   '(linum ((t (:foreground "#fffffe"))))

   ;;------------------------------Company------------------------------
   '(company-preview ((t (:background "#373B41" :foreground "wheat"))))
   '(company-preview-common ((t (:inherit company-preview :foreground "wheat"))))
   '(company-tooltip-common ((t (:foreground "#FFFDD5")))) ;Color de las letras en coincidencia en pop
   '(company-tooltip-selection ((t (:background "#7B7B7B")))) ;Color de seleccion resaltado.
   '(company-tooltip ((t (:background "#0B0B0B" :foreground "#C5C8C6")))) ;Color fondo y letra
   '(company-scrollbar-bg ((t (:background "#282A2E")))) ;Color de scrollbar
   '(company-scrollbar-fg ((t (:background "#373B41"))))
   '(company-tooltip-annotation ((t (:foreground "#F0DFAF"))))

   '(company-template-field ((t (:foreground "white" :background "#525252"))))

   ;;------------------------------Helm------------------------------
   '(helm-source-header ((t (:extend t :foreground "#5bb499" :weight bold))))
   '(helm-match ((t (:extend t :foreground "#8ce7cc"))))
   '(helm-selection ((t (:extend t :background "gray37" :distant-foreground "black"))))

   '(helm-ff-directory ((t (:extend t :foreground "#F0DFAF"))))
   '(helm-ff-dotted-directory ((t (:extend t :foreground "#d6d6d6"))))

   ;;-------------------------Tabs------------------------------
   '(tab-bar ((t (:inherit fixed-pitch :background "#1e1d1e" :foreground "#ededed"))))
   '(tab-bar-tab ((t (:box nil :background "#1e1d1e" :inherit (tab-bar)))))
   '(tab-bar-tab-inactive ((t (:background "#3a3636" :foreground "#ededed" :inherit (tab-bar-tab)))))

   ;; ---------------- Package Specific Stuff -----------

   ;;-------------------------Powerline------------------------------
   `(powerline-active1 ((t (:background ,church-off-white :foreground ,church-background))))

   ;;--------------------Web mode --------------------
   '(web-mode-doctype-face ((t (:foreground "lightblue")))) ;turquoise , lightblue, PaleTurquoise
   '(web-mode-html-tag-face ((t (:foreground "#FFF8DC")))); amarillo
   ;;'(web-mode-html-tag-face ((t (:foreground "#EFFBFF"))));Color de los brackets
   '(web-mode-html-attr-name-face ((t (:foreground "#BCEDDE")))) ;verde claro
   '(web-mode-html-attr-value-face ((t (:foreground "#CAB4CC")))) ;morado
   '(web-mode-comment-face ((t (:foreground "#EFFBFF" :slant italic)))) ;; Color blanco

   ;;----------------------JS2-mode------------------------------------
   '(js2-function-call ((t (:foreground "#FFF8DC")))) ; amarillo claro
   '(js2-object-property ((t (:foreground "#FFF8DC")))) ;amarillo claro
   '(js2-external-variable ((t (:foreground "#9ecce1")))) ; azul
   ;;'(js2-error ((t (:foreground "#f05666")))) ;; rojo claro
   ;;'(js2-warning ((t (:underline "#EB9490")))) ;; rojo
   '(js2-error ((t (:foreground "#ed5f70" :slant italic :weight semi-bold))))
   '(js2-warning ((t (:underline (:color "#EB9490" :style wave) :slant italic))))
   '(js2-function-param ((t (:foreground "#d6d6d6")))) ;; color de la letra normal

   ;;----------------- Diredfl -----------------------------
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
   ;;----------- display line numbers--------------
   '(line-number ((t (:inherit (shadow default) :foreground "#656666")))) ;; letras grises
   ;; '(line-number-current-line ((t (:inherit line-number :foreground "#Ffffff"))))
   '(line-number-current-line ((t (:inherit line-number :foreground "#Ffffff"
                                            :background "#2b2b2b"))))
   
   ;; Flycheck
   '(flycheck-error ((t (:underline (:color "#e2544e" :style wave) :slant italic))))
   '(flycheck-error-list-error ((t (:weight semi-bold :foreground "#e37c60"))))
   '(flycheck-fringe-error ((t (:inherit (flycheck-error-list-error)))))
   ;; highlight-indent
   '(highlight-indentation-face ((t (:inherit hl-line))))
   '(highlight-indentation-current-column-face ((t (:inherit region))))

   ;; Esta dos propiedaes cambian varias propiedades de su herencia, con
   ;; esto cambiaria con efecto cadena
   
   '(success ((t (:foreground "#86B187" :weight semi-bold))))
   '(warning ((t (:foreground "#F4B3A0" :weight semi-bold))))

   ;; Rainbow mode
   '(rainbow-delimiters-depth-1-face ((t (:foreground "#ededed")))) ;; blanco
   '(rainbow-delimiters-depth-2-face ((t (:foreground "#93a8c6")))) ;; azul
   '(rainbow-delimiters-depth-3-face ((t (:foreground "#e4e9c8")))) ;; Amarillo
   '(rainbow-delimiters-depth-4-face ((t (:foreground "#97b098")))) ;; verde
   '(rainbow-delimiters-depth-5-face ((t (:foreground "#8f6561")))) ;; Cafe-rojo

   ;; Eshell mode
   '(eshell-ls-symlink ((t (:foreground "#a0e1df"))))
   '(eshell-ls-executable ((t (:foreground "#ceeca4"))))
   '(eshell-ls-directory ((t (:foreground "#9dd0e8"))))
   
   )

  )



;;;###Autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name)))
  (when (not window-system)
    (custom-set-faces '(default ((t (:background nil)))))))

(provide-theme 'church)

;; Local Variables:
;; no-byte-compile: t
;; End:
