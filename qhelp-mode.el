;;; qhelp-mode.el --- Major mode for CodeQL qhelp files -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Ed Minnix
;;
;; Author: Ed Minnix <egregius313@github.com>
;; Maintainer: Ed Minnix <egregius313@github.com>
;; Created: September 28, 2022
;; Modified: September 28, 2022
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/egregius313/qhelp-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; GitHub's CodeQL queries store documentation in XML files ending in the
;; extension *.qhelp.
;;
;;; Code:

(defgroup qhelp nil "QHelp files."
  :group 'languages)

(define-derived-mode qhelp-mode
  sgml-mode
  "QHelp"
  "Major mode for CodeQL qhelp files."
  :group 'qhelp)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.qhelp\\'" . qhelp-mode))

(eval-after-load 'yasnippet
  '(let ((snippet-dir (expand-file-name "snippets" (file-name-directory (or load-file-name (buffer-file-name))))))
     (message snippet-dir)
     (add-to-list 'yas-snippet-dirs snippet-dir t)
     (yas-load-directory snippet-dir)
     t))

(when (fboundp 'set-file-template!)
  (set-file-template! 'qhelp-mode
    :trigger "__qhelp"
    :mode 'qhelp-mode))

(provide 'qhelp-mode)
;;; qhelp-mode.el ends here
