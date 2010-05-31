(in-package :cl-user)

(asdf:defsystem :cl-ircd
  :description "An IRCd written in Common Lisp."
  :depends-on (:usocket)
  :components ((:file "cl-ircd")))
