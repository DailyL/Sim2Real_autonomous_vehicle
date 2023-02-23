
(cl:in-package :asdf)

(defsystem "navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GraphSearch" :depends-on ("_package_GraphSearch"))
    (:file "_package_GraphSearch" :depends-on ("_package"))
  ))