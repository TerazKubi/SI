(define
	(domain blocks)
	(:requirements :adl)
	(:predicates
		(on-top ?x ?y)
		(on-floor ?x)
		(clear ?x)
		(podniesiony ?x)
	)
	; podnies paczke z podlogi
	(:action podnies-z-podlogi
		:parameters (?x)
		:precondition
		(and
			(clear ?x)
			(on-floor ?x)
			    
			
		)
		:effect
		(and
			(not (on-floor ?x))
			(podniesiony ?x)
		)
	)
	; podnies paczke z podlogi
	(:action podnies-z-klocka
		:parameters (?x ?z)
		:precondition
		(and
			(clear ?x)
			(on-top ?x ?z)
			    
			
		)
		:effect
		(and
			(not (on-top ?x ?z))
			(clear ?z)
			(podniesiony ?x)
		)
	)
	; przesuń paczkę na podloge
	(:action oposc-na-podloge
		:parameters (?x)
		:precondition
		(and
			(podniesiony ?x)
			(clear ?x)
		)
		:effect
		(and
			(on-floor ?x)
			(clear ?x)
			(not (podniesiony ?x))
			
		)
	)
	; przesuń paczkę na inny kolcek
	(:action oposc-na-klocek
		:parameters (?x ?z)
		:precondition
		(and
			(podniesiony ?x)
			(clear ?x)
			(clear ?z)
		)
		:effect
		(and
			(on-top ?x ?z)
			(clear ?x)
			(not (podniesiony ?x))
			(not (clear ?z))
			
		)
	)
)