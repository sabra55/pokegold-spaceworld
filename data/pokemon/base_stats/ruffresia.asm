	db DEX_RUFFRESIA ; 045

	db  75,  80,  85,  50, 100,  95
	;   hp  atk  def  spd  sat  sdf

	db TYPE_GRASS, TYPE_POISON ; type
	db 45 ; catch rate
	db 184 ; base exp
	db ITEM_APPLE, ITEM_MYSTIC_PETAL ; items
	db GENDER_50_50 ; gender ratio
	db 100, 4, 70 ; unknown
	dn 7, 7 ; sprite dimensions
	dw RuffresiaPicFront, RuffresiaPicBack ; sprites
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 15, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

