(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)


;; General keys
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<backtab>") 'other-window)

(global-set-key (kbd "C-c m") 'split-window-right)
(global-set-key (kbd "C-c n") 'split-window-below)
(global-set-key (kbd "C-c k") 'kill-this-buffer)

;; Cursor avoid mouse
(mouse-avoidance-mode 'cat-and-mouse)
 	
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))


;; Theme

;; Moe-theme
(require 'moe-theme)

;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Resize titles (optional).
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Choose a color for mode-line.(Default: blue)
(moe-theme-set-color 'cyan)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
(moe-light)


(display-battery-mode t)
(display-time-mode t)
(show-paren-mode t)
(size-indication-mode t)
(linum-mode t)

(setq inhibit-startup-screen t)
(setq python-shell-interpreter "python3.6")
(setq scheme-program-name "csi")

;; Menus and stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(custom-set-faces '(default ((t (:family "Fira Mono" :foundry "CTDB" :slant normal :weight normal :height 83 :width normal)))))

;; Emacs Window Manager

;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-default)

;;(global-set-key (kbd "s-q") 'exwm-workspace-delete)
;;(global-set-key (kbd "<s-tab>") 'exwm-workspace-delete)
;;(global-set-key (kbd "C-c b") 'battery)




(require 'powerline)
(powerline-default-theme)


(ac-config-default)
