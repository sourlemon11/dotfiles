
(provide '_javascript)

(defun node-repl () (interactive)
       (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))
;; load node automatically
(with-eval-after-load 'javascript/init-js2-mode (node-repl))
