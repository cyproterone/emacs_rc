;;#################### ########### ####################
;;#################### Init Region ####################
;;#################### ########### ####################
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))


;;#################### ################## ####################
;;#################### Performance Region ####################
;;#################### ################## ####################

;; gc tweak
(setq gc-cons-threshold (* 100 1000 1000))

;; process comm tweak
(setq read-process-output-max (* 1000 1000))

;; start tcp server
(require 'server)
(setq server-socket-dir (expand-file-name "server" user-emacs-directory))
(setq server-use-tcp t)
(unless (server-running-p)
  (server-start))


;;#################### ############## ####################
;;#################### Customs Region ####################
;;#################### ############## ####################

;; set custom el
(let
  ((cf (expand-file-name "_customize.el" user-emacs-directory)))
  (when (not (file-exists-p cf))
    (write-region "" nil cf))
  (setq custom-file cf)
  (load custom-file))


;;#################### ################### ####################
;;#################### Dependencies Region ####################
;;#################### ################### ####################
(require 'init-lib)
(require 'init-elpa)
(require 'init-misc)
(require 'init-keyboard)
(require 'init-mouse)
(require 'init-helm)
(require 'init-ivy)
(require 'init-search)
(require 'init-git)
(require 'init-wm)
(require 'init-fm)
(require 'init-tree)
(require 'init-proj)
(require 'init-editor)
(require 'init-themes)
(require 'init-fun)


;;#################### ########### ####################
;;#################### Lang Region ####################
;;#################### ########### ####################
(require 'lang-elisp)
(require 'lang-json)
(require 'lang-markdown)
(require 'lang-typescript)
(require 'lang-yaml)
