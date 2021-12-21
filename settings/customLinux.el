;; Ajuste de la letra
;;(set-face-attribute 'default nil :height 133) ;; Default Source Code Pro
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 135)
;;(set-face-attribute 'default nil :font "Source Code Pro" :height 140)
;;(set-face-attribute 'default nil :font "Source Code Pro" :height 160)
(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 160)

;; Adjustar ventana para monitor 24"
(when window-system (set-frame-size (selected-frame) 101 28)) ;; Tamanio de la ventana
(set-frame-position (selected-frame) 300 130)  ;; Posicion de la ventana


(add-hook 'prog-mode-hook 'auto-fill-mode) ;; Rompe las lineas cuando son muy grandes.


(global-set-key (kbd "C-'") 'isearch-forward)
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
(global-set-key (kbd "C-x <up>") 'counsel-imenu)
(global-set-key (kbd "C-x <down>") 'counsel-switch-buffer)


;;Solo funciona en linux
(defun my-split-window-below ()
  (interactive)
  (split-window-below)
  (other-window 1)
  ;;(counsel-find-file)
  (ibuffer)
  )

(defun my-split-window-right ()
  (interactive)
  (split-window-right)
  (other-window 1)
  ;;(find-file ".")
  ;;(counsel-find-file)
  (ibuffer)
  )

(global-set-key (kbd "C-x 2") 'my-split-window-below)
(global-set-key (kbd "C-x 3") 'my-split-window-right)

;;(global-set-key (kbd "C-x M-t") 'counsel-load-theme)
(global-set-key (kbd "C-M-k") 'counsel-switch-buffer)
(global-set-key (kbd "C-M-j") 'counsel-ibuffer)

(global-set-key (kbd "C-M-l") 'next-buffer)
(global-set-key (kbd "C-M-h") 'previous-buffer)


(global-set-key [remap describe-function] 'counsel-describe-function)
(global-set-key [remap describe-variable] 'counsel-describe-variable)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  
  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous)
  )
