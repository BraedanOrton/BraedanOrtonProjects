; TO DO: fill in your header doc. here
;        (delete this comment)


start:  move.b		#CR,d0
	jsr		write_char
	move.b		#LF,d0
	jsr		write_char
	jsr		read_char
	clr.l		d1	
	move.b		d0,d1
	jsr		read_char
	clr.l		d2
	move.b		d0,d2	
	jsr		read_char 
	clr.l		d3
	move.b		d0,d3

	sub.b		#ZERO,d1 ;Changing from character to integer
	sub.b		#ZERO,d2 
	sub.b		#ZERO,d3

	muls.w		#100,d1 ;Adjusting to correct digit position
	muls.w		#10,d2

	clr.l		d4
	add.l		d1,d4 ;Adds the three digits into one number
	add.l		d2,d4
	add.l		d3,d4

;	Y = (4X^2 + (23X + 136)/3)%100

	move.l		d4,d5	
	muls.w		#23,d5	;X*23
	add.w		#136,d5	; + 136
	divs.w		#3,d5	; / 3

	move.l		d4,d6
	muls.w		d6,d6	; X^2
	asl.l		#2,d6	; *4	

	move.w		d5,d4 ;Removes remainder from MS word
	
	add.l		d6,d4	
	divs.w		#1000,d4 
	swap.w		d4	; %1000

;	Converting first digit into a character
	move.w		d4,d1
	divs.w		#100,d1
	add.b		#ZERO,d1

;	Converting second digit into a character
	move.w		d4,d2
	divs.w		#10,d2
	ext.l		d2	;Clears MS word
	divs.w		#10,d2
	swap.w		d2
	add.b		#ZERO,d2

;	Converting third digit into a character	
	move.w		d4,d3
	divs.w		#10,d3
	swap.w		d3
	add.b		#ZERO,d3

;	Printing characters to screen
	move.b		#CR,d0
	jsr		write_char
	move.b		#LF,d0
	jsr		write_char
	move.b		d1,d0
	jsr		write_char
	move.b		d2,d0
	jsr		write_char
	move.b		d3,d0
	jsr		write_char	

	jsr		read_char
	jsr	exit


;----- SUBROUTINE: read_char -----
;
; PURPOSE: waits for and reads a single keystroke from the keyboard.
;
; CALLER OUTPUT: returns the ASCII value of the key in the low byte
;                of D0.
;
; IMPORTANT: NOTE THAT THE HIGHER_ORDER BYTES OF D0 ARE UNDEFINED.
;            DON'T ASSUME THEY ARE ZEROED OUT!
;
; E.G. CALL:	jsr	read_char
;		... now use D0.b ...

read_char:	movem.l	d1-d2/a0-a2,-(sp)
		move.w	#1,-(sp)
		trap	#1
		addq.l	#2,sp	
		movem.l	(sp)+,d1-d2/a0-a2
		rts


;----- SUBROUTINE: write_char -----
;
; PURPOSE: writes a single character to the screen.
;
; CALLER INPUT: takes the ASCII value of the character in the low byte
;               of D0.
;
; E.G. CALL:	move.b	#'a',d0
;		jsr	write_char

write_char:	movem.l	d0-d2/a0-a2,-(sp)
		and.w	#$00FF,d0
		move.w	d0,-(sp)
		move.w	#2,-(sp)
		trap	#1
		addq.l	#4,sp
		movem.l	(sp)+,d0-d2/a0-a2
		rts


;----- SUBROUTINE: exit -----
;
; PURPOSE: terminates the program.  This routine never returns.

exit:		clr.w	-(sp)
		trap	#1


ZERO:		equ	48
CR:		equ	13
LF:		equ	10	