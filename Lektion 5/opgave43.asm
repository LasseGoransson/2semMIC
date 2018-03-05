.include "m32def.inc"

.equ TEMP0 = $60
.equ TEMP1 = $61
.equ TEMP2 = $62
.equ TEMP3 = $63
.equ TEMP4 = $64
.equ TEMP5 = $65

ldi R17,$11

sts TEMP0,R17
sts TEMP1,R17
sts TEMP2,R17
sts TEMP3,R17
sts TEMP4,R17
sts TEMP5,R17

lds R16,TEMP0
ldi R29,$00

add R29,R16

lds R16,TEMP0
add R29,R16

lds R16,TEMP1
add R29,R16

lds R16,TEMP2
add R29,R16

lds R16,TEMP3
add R29,R16

lds R16,TEMP4
add R29,R16

lds R16,TEMP5
add R29,R16
