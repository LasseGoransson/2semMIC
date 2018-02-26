.include "m32def.inc"

	rjmp	RESET

;Initialisér programmet
RESET:

; PORTC setup
	ldi		R16, 0x00			;
	out		DDRC, R16			; Set PORTC as input
	ldi		R16, 255			;
	out 	PORTC,R16 		; Enable pull-up on PORTC

  ; PORTB setup
  	out 	DDRB,R16 			; PORTB = output R16 is high from line 8
    rjmp	LOOP ; Start loop

LOOP:

in R16,PINC ; Get pins
com r16
ldi R17,0x00
or R16,R17
brne SHOW

ldi r18,0b11111111
out PORTB,r18

rjmp LOOP


SHOW:
ldi r18,0b01111111
out PORTB,r18
rjmp LOOP

; Hex values for display
; 1. seg = 11111110 = 0xFE
; 2. seg = 11111101 = 0xFD
; 3. Seg = 11111011 = 0xFB
; 4. Seg = 11110111 = 0xF7
; 5. seg = 11101111 = 0xEF
; 6. seg = 11011111 = 0xDF
; 7. seg = 10111111 = 0xBF
; Punktum = 01111111 = 0x7F
