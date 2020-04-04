;;#################### ############## ####################
;;#################### Windows Region ####################
;;#################### ############## ####################

;; quit window
(bind-key "C-w" 'delete-window)


;; move cursor around windows with ctl left right
(windmove-default-keybindings 'control)


;; resize window
(defhydra hy-resize-window (global-map "C-x")
  ("<up>" enlarge-window "taller")
  ("<down>" shrink-window "shorter")
  ("<right>" enlarge-window-horizontally "wider")
  ("<left>" shrink-window-horizontally "hydra-zoom"))


;; split window
(bind-key "C-c ]" 'split-window-right)
(bind-key "C-c [" 'split-window-below)


;; allow C-c w <num> to selec window
(use-package winum
  :ensure t
  :custom
  (winum-auto-setup-mode-line nil)
  :config
  (winum-mode))


;; make popup panes easier to dismiss
(use-package popwin
  :ensure t
  :config
  (popwin-mode t))


;; make imenu a side pane
(use-package imenu-list
  :ensure t
  :bind (("C-i" . imenu-list-smart-toggle))
  :custom
  (imenu-list-auto-resize nil))
;; restore tab key
(bind-key "TAB" 'indent-for-tab-command)


;;#################### ############## ####################
;;#################### Buffers Region ####################
;;#################### ############## ####################

;; ibuffer sort by mode
(require 'ibuffer)
(setq ibuffer-default-sorting-mode 'major-mode)

;; ibuffer auto refresh
(add-hook
  'ibuffer-mode-hook
  (lambda ()
    (ibuffer-auto-mode t)))


;; bring up ibuffer
(bind-key "C-b" 'ibuffer)


;;#################### END ####################
(provide 'init-wm)
