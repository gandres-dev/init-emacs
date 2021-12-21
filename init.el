;; Initial configuration para ambos Linux and Windows
(setq custom-file "~/.emacs.d/settings/customInitial.el")
(load custom-file)

;; Paquetes 
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

;; Theme
;; Cargamos nuestra paleta de colores para nuestro tema en particular.
;; Solo cuando es ejecutado con windos-system (GUI), valor x or nil.
(if window-system
    (progn
      (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/Dijkstra-theme/")
      (load-theme 'dijkstra t)

      (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/Church-theme")
      ;;(load-theme 'church t)
      
      ;; (global-set-key [remap goto-line] 'goto-line-with-feedback)
    )    
)

(provide 'init)

;;; init.el ends here
