;; Initial configuration para ambos Linux and Windows
(setq custom-file "~/.emacs.d/settings/customInitial.el")
(load custom-file)

;(if window-system
;    (message "IF")
;  (progn
;    (message "Hola")
;    ))

;; Solo cuando es ejecutado con window-system (GUI), valor x or nil.
(if window-system
    (progn

      ;; Cargamos los Paquetes para Windows-system
      (setq custom-file "~/.emacs.d/plugins/packages.el")
      (load custom-file)

      ;;Ajustamos nuestras configuraciones dependiendo de nuestro sistema operativo.
      (if (eq system-type 'windows-nt)
	  (progn
	    ;; (message "Estas es un system Windows!")
	    ;; (setq custom-file "~/.emacs.d/initFileEmacs/customMeWindows.el")
	    ;; (load custom-file)
	    )
	)

      (if (eq system-type 'gnu/linux)
	  (progn
	    ;;(message "Estas es un system Linux!")
	    (setq custom-file "~/.emacs.d/settings/customLinux.el")    
	    (load custom-file)
	    (setq custom-file "~/.emacs.d/settings/customFacesLinux.el")
	    (load custom-file)
	    )
	)

      
      ;; Cargamos nuestra paleta de colores para nuestro tema en particular.

      ;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/Dijkstra-theme/")
      ;;(load-theme 'dijkstra t)

      (load-theme 'deeper-blue)      
      (if  (eq (car custom-enabled-themes) 'deeper-blue)
          (progn
            (custom-set-faces
             ;; Web-mode
             '(web-mode-doctype-face ((t (:foreground "lightblue"))))
             '(web-mode-html-tag-face ((t (:foreground "#398ecc"))))
             '(web-mode-html-attr-name-face ((t (:foreground "#fff4cc"))))
             '(web-mode-html-attr-value-face ((t (:foreground "#edb0a0"))))

             ;; '(web-mode-doctype-face ((t (:foreground "CadetBlue1"))))
             ;; '(web-mode-html-tag-face ((t (:foreground "DeepSkyBlue1"))))
             ;; '(web-mode-html-attr-name-face ((t (:foreground "goldenrod"))))
             ;; '(web-mode-html-attr-value-face ((t (:foreground "moccasin"))))

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

             '(tooltip ((t (:background "#181A26"))))
             )
            (set-face-background 'highlight-indentation-face "#181A26")
            )
        )

      (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/Church-theme")
      ;;(load-theme 'church t)
      
      ;; (global-set-key [remap goto-line] 'goto-line-with-feedback)
      )
  (progn
    ;; Search file: M-x ffap
    (setq custom-file "~/.emacs.d/plugins/packagesforTerm.el")
    (load custom-file)    
    )
)

(provide 'init)

;;; init.el ends here
