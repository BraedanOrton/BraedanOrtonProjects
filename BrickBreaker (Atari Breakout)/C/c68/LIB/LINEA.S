; Line A bindings for Sozobon C/c68 by dpg, adapted from jrb's
; minor bug fixes by tr, with help from Paul Pospisil
;
; include by doing the following
;
;	jas linea.s
;	ar rv libc.a linea.o

	.bss

	.globl ___aline
___aline:
	.ds.l	1
	.globl ___fonts
___fonts:
	.ds.l	1
	.globl ___funcs
___funcs:
	.ds.l	1

	.text

	.globl _linea0
_linea0:
	.dc.w   $A000
	move.l	a0,___aline	
	move.l	a1,___fonts
	move.l	a2,___funcs					
	rts

	.globl _linea1
_linea1: 							
	.dc.w   $A001
	rts

	.globl _linea2
_linea2:
	.dc.w   $A002
	rts

	.globl _linea3
_linea3: 							
	.dc.w   $A003
	rts

	.globl _linea4
_linea4: 							
	.dc.w   $A004
	rts

	.globl _linea5
_linea5: 							
	.dc.w   $A005
	rts

	.globl _linea6
_linea6: 							
	.dc.w   $A006
	rts

	.globl _linea7
_linea7:
	move.l	a6,-(sp)
	move.l	8(sp),a6
	.dc.w   $A007
	move.l	(sp)+,a6
	rts

	.globl _linea8
_linea8: 							
	.dc.w   $A008
	rts

	.globl _linea9
_linea9: 							
	.dc.w   $A009
	rts

	.globl _lineaa
_lineaa: 							
	.dc.w   $A00A
	rts

	.globl _lineab
_lineab: 							
	.dc.w   $A00B
	rts

	.globl _lineac
_lineac:
	move.l	a6,-(sp)
	move.l	8(sp),a2
	.dc.w   $A00C
	move.l	(sp)+,a6
	rts

	.globl _linead
_linead:
	move.l	a6,-(sp)
	move.w	8(sp),d0
	move.w	10(sp),d1
	move.l	12(sp),a0
	move.l	16(sp),a2
	.dc.w   $A00D
	move.l	(sp)+,a6
	rts

	.globl _lineae
_lineae: 							
	.dc.w   $A00E
	rts

	.globl _lineaf
_lineaf: 							
	.dc.w   $A00F
	rts
