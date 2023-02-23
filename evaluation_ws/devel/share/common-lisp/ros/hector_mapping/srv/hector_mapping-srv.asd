
(cl:in-package :asdf)

(defsystem "hector_mapping-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ResetMapping" :depends-on ("_package_ResetMapping"))
    (:file "_package_ResetMapping" :depends-on ("_package"))
  ))