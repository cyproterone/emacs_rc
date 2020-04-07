;;#################### ########## ####################
;;#################### Ivy Region ####################
;;#################### ########## ####################

;; search agent
(use-package ivy
  :ensure t
  :demand t
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-wrap t)
  (ivy-on-del-error-function nil)
  (ivy-height 20)
  (ivy-count-format "(%d/%d) ")
  :bind (:map ivy-minibuffer-map
              ("TAB" . ivy-partial)
              ("RET" . ivy-alt-done)
              ("M-RET" . ivy-done))
  :config
  (ivy-mode t))


;; replace default searches
(use-package counsel
  :ensure t
  :demand t
  :after (ivy)
  :init
  (bind-keys
    :prefix-map counsel-command-map
    :prefix "C-l")
  :bind (("C-p" . counsel-M-x)
         :map search-command-map
           ("C-c" . counsel-recentf)
           ("C-f" . counsel-fzf)
           ("C-r" . counsel-rg)
         :map counsel-command-map
           ("C-d" . counsel-find-file)
           ("C-o" . counsel-minor)
           ("C-p" . counsel-major))
  :config
  (counsel-mode))


;; sorting backend for company, ivy. etc
(use-package prescient
  :ensure t
  :custom
  (prescient-history-length 10 "hist items displayed")
  :config
  (prescient-persist-mode))


(use-package ivy-prescient
  :ensure t
  :after (prescient ivy counsel)
  :config
  (ivy-prescient-mode))


;; prettier ivy
(use-package ivy-rich
  :ensure t
  :after (ivy counsel)
  :config
  (setcdr (assq t ivy-format-functions-alist) 'ivy-format-function-line)
  (ivy-rich-mode t))


;; search in buffer
(use-package swiper
  :ensure t
  :after (ivy)
  :bind (:map search-command-map
              ("C-s" . swiper)))


;; use ivy in xref TODO: remove emacs <27
(use-package ivy-xref
  :ensure t
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))


;;#################### END ####################
(provide 'init-ivy)
