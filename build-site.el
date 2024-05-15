;; Set the Emacs package system
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initilize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(setq org-html-validation-link nil
      org-html-include-scripts nil
      org-html-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "docs.commapp.online"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creator nil
             :with-toc t
             :section-numbers nil
             :time-stamp-file t)))

;; Generate the site output
(org-publish-all t)

;; Done, message
(message "Build complete!")
