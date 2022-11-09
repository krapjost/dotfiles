;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "krapjost"
      user-mail-address "krapjost@gmail.com")
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'semi-light))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;

;; (setq doom-theme 'doom-flatwhite)
(setq doom-theme 'doom-badger)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


(defun org-roam-hugo-template ()
  (mapconcat #'identity
             `("#+title: ${title}"
               "#+hugo_base_dir: ~/blog"
               "#+hugo_section: posts"
               "#+hugo_publishdate: %T"
               "#+hugo_front_matter_format: yaml"
               "#+hugo_auto_set_lastmod: t"
               "#+filetags: %?\n")
             "\n"))


(defun org-roam-hugo-template-ko ()
  (mapconcat #'identity
             `("#+title: ${title}"
               "#+hugo_base_dir: ~/blog"
               "#+hugo_section: ../content_ko/posts"
               "#+hugo_publishdate: %T"
               "#+hugo_front_matter_format: yaml"
               "#+hugo_auto_set_lastmod: t"
               "#+filetags: %?\n")
             "\n"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory (file-truename "~/org/roam"))
(setq org-roam-completion-everywhere t)
(setq find-file-visit-truename t)
(org-roam-db-autosync-mode)
(setq org-roam-capture-templates
      '(("e" "En Posts" plain
         (function org-roam-hugo-template)
         :target (file "%<%y%m%d%H%M%S>-${slug}-en.org")
         :unarrowed t)
        ("k" "Ko Posts" plain
         (function org-roam-hugo-template-ko)
         :target (file "%<%y%m%d%H%M%S>-${slug}-ko.org")
         :unarrowed t)))


(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
   See `org-capture-templates' for more information."
    (let* ((date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
           (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(,(concat "* TODO " title)
                   ":PROPERTIES:"
                    ,(concat ":EXPORT_FILE_NAME: " fname)
                     ,(concat ":EXPORT_DATE: " date)
                     ":END:"
                     "%?\n")
                  "\n")))

  (add-to-list 'org-capture-templates
               '("e"                ;`org-capture' binding + e
                 "English posts"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "en-posts.org" "Posts")
                 (function org-hugo-new-subtree-post-capture-template)))

  (add-to-list 'org-capture-templates
               '("k"                ;`org-capture' binding + k
                 "Korean posts"
                 entry
                 (file+olp "ko-posts.org" "Posts")
                 (function org-hugo-new-subtree-post-capture-template))))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :leader :desc "Capture Roam" :n "R" #'org-roam-capture)
(map! :leader :desc "Wakatime" :n "W" #'wakatime-mode)

(after! lispy
  (setq lispy-compat "cider"))

(after! eww
  (setq browse-url-browser-function 'eww-browse-url))

(after! wakatime-mode
  (setq wakatime-cli-path "/usr/bin/wakatime-cli")
  (global-wakatime-mode))

(after! cider
  (set-popup-rules!
   '(("^\\*cider-repl"
      :side right
      :width 80
      :quit nil
      :ttl nil))))
