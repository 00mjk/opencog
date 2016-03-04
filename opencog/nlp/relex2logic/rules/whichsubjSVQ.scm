; This is for which-subjects of SV sentences, as in
; "Which movie sucks more, "Enemy Mine" or "Event Horizon"?
; (definitely Enemy Mine)
; (AN June 2015)


(define whichsubjSVQ
	(BindLink
		(VariableList
			(var-decl "$a-parse" "ParseNode")
			(var-decl "$subj" "WordInstanceNode")
			(var-decl "$verb" "WordInstanceNode")
			(var-decl "$obj" "WordInstanceNode")
			(var-decl "$qVar" "WordInstanceNode")
		)
		(AndLink
			(word-in-parse "$subj" "$a-parse")
			(word-in-parse "$verb" "$a-parse")
			(dependency "_subj" "$verb" "$subj")
			(AbsentLink (dependency "_obj" "$verb" "$obj"))
			(dependency "_det" "$subj" "$qVar")
			(word-feat "$qVar" "which")
		)
		(ExecutionOutputLink
			(GroundedSchemaNode "scm: pre-whichsubjSVQ-rule")
			(ListLink
				(VariableNode "$subj")
				(VariableNode "$verb")

			)
		)
	)
)

; XXX FIXME: define the whichsubjSVQ-rule
; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-whichsubjSVQ-rule subj verb)
	(whichsubjSVQ-rule (cog-name (word-inst-get-lemma  subj)) (cog-name subj)
			  (cog-name (word-inst-get-lemma  verb)) (cog-name verb)
	)
)
