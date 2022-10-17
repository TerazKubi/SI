(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		;(idz ?start ?stop)
		;(pchaj ?start ?paczka_start ?paczka_stop)
		(poziomo ?x ?y)
		(pionowo ?x ?y)
		(robot ?x)
		(paczka ?x)
		(cel ?x)
	)
	; idz do wskazanego pola
	(:action idz
		:parameters (?start ?stop)
		:precondition
		(and
			(or (pionowo?start ?stop) (poziomo?start ?stop))
			(not ( paczka ?stop ) )
			(robot ?start)
		)
		:effect
		(and
			(not (robot ?start))
			(robot ?stop)
			
		)
	)
	; pchaj paczke
	(:action pchaj
		:parameters (?start ?stop ?paczka_stop)
		:precondition
		(and
		    (or
		        (and (pionowo ?start ?stop) (pionowo ?stop ?paczka_stop) )
		        (and (poziomo ?start ?stop) (poziomo ?stop ?paczka_stop) )
		    )
			
			(not (= ?start ?paczka_stop))
			 
			
			
			(not (paczka ?start)) ;nie ma paczki w miejscu robota
			(paczka ?stop) ;czy paczka jest obok robota
			(robot ?start) ;robot jest na starcie
			(not (paczka ?paczka_stop)) ; czy nie ma paczki w miejscu gdzie ma byc paczka
			
		)
		:effect
		(and
			(not (robot ?start))
			(robot ?stop)
			(not (paczka ?stop))
			(paczka ?paczka_stop)
			
		)
	)
	
	
)