(defpackage :cl-ircd
  (:use :cl :usocket))

(in-package :cl-ircd)

(defvar *server-socket* nil
  "The main socket for the server.")

(defvar *connections* (make-hash-table)
  "A list of connections to the server.")

(defun create-server (host port)
  (setq *server-socket* (socket-listen host port)))

(defun destroy-server ()
  (socket-close *server-socket*)
  (setq *server-socket* nil))

(defun accept-client ()
  (let ((client (socket-accept *server-socket*)))
    (setf (gethash client *connections*) (list :registered nil
					       :nick nil
					       :user nil))))
