.include "m32def.inc"

.equ dispA = 0b10111111
.equ dispB = 0b11110111
.equ dispC = 0b11111011
.equ dispD = 0b11111101
.equ dispE = 0b11111110
.equ dispF = 0b11101111

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

    ldi r18,0xff ; R18 = 255
    out PORTB,R18 ; Sluk alle segmenter i displayet

    ldi R20,0 ; R20 indeholder displayets værdi og starter som nul
    ldi r29,255 ; r29 indeholder pin konfiguration og starter som FF
    rjmp	LOOP ; Start loop





    LOOP: ; Loop

    in R30,PINC ; Get pins

		; Start debounce delay
    LDI r23,250
    DELAY1:


    LDI R21, 2
    DELAY2:
    NOP
    NOP
    NOP
    DEC R21
    BRNE DELAY2

    DEC R23
    BRNE DELAY1
		; Slut debounce delay

    in R31,PINC ; Get pins
    AND r30,r31
    BREQ LOOP
    ; Debounced

    com r30
    ldi R17,0x00
    or R30,R17
    breq LOOP
    ; en eller flere kontakter aktiv

    cp r29,r31 ; Kontroller om konfiguration har ændret sig fornyligt
    breq loop

    mov r29,r31 ; Gem den nye konfiguration

    CPI R20,0 ; Start
    breq SHOWA

    CPI R20,dispA
    breq SHOWB

    CPI R20,dispB
    breq SHOWC

    CPI R20,dispC
    breq SHOWD

    CPI R20,dispD
    breq SHOWE

    CPI R20,dispE
    breq SHOWF

    CPI R20,dispF
    breq SHOWA


    rjmp LOOP

    SHOWA:
    ldi R20,dispA
    out PORTB,R20
    rjmp LOOP

    SHOWB:
    ldi R20,dispB
    out PORTB,R20
    rjmp LOOP

    SHOWC:
    ldi R20,dispC
    out PORTB,R20
    rjmp LOOP

    SHOWD:
    ldi R20,dispD
    out PORTB,R20
    rjmp LOOP

    SHOWE:
    ldi R20,dispE
    out PORTB,R20
    rjmp LOOP

    SHOWF:
    ldi R20,dispF
    out PORTB,R20
    rjmp LOOP
