	db DEX_KAMEX ; 009

	db  79,  83, 100,  78,  85, 100
	;   hp  atk  def  spd  sat  sdf

	db TYPE_WATER, TYPE_WATER ; type
	db 45 ; catch rate
	db 210 ; base exp
	db ITEM_APPLE, ITEM_STEEL_SHELL ; items
	db GENDER_50_50 ; gender ratio
	db 100, 4, 70 ; unknown
	dn 7, 7 ; sprite dimensions
	dw $54ac, $56b6 ; sprites
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 26, 27, 28, 31, 32, 33, 34, 40, 44, 50, 53, 54
	; end
