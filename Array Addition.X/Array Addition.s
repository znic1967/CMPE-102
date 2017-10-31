; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; ary_addition.s - Array Addition Assembly
; *************************************************************


; Assembly Code
; =============
.text
.global __reset
__reset:

  ; Initialize Matrix  A
    mov #14, W0
    SL W0,#8,W0 ;Shift left 2 bits
    mov.b #2,W0
    mov W0, 0x1000
    
    mov #38, W0
    SL W0, #8, W0
    mov.b #26,W0
    mov W0, 0x1002
    
; Initialize Matrix  B
    mov #1,W0
    SL W0, #8, W0
    mov W0, 0x1060 ; MSB = 0x1061
    
    mov #25, W0
    SL W0, #8, W0
    mov.b #13, W0
    mov W0, 0x1062

    mov #37,W0
    mov W0, 0x1064 ; MSB = 0x1061

; Add Matrices

mov 0x1000, W1 ; Moves 0x1000 and 0x1001 to W1
mov 0x1002, W2 ; Moves 0x1002 and 0x1003 to W2

;The following code lines up LSB and MSB in Matrix B so 
;A and B can be added directly without byte manipulation
mov 0x1060, W3
LSR W3, #8 ,W3
mov 0x1062, W4
mov.b W3,W4 ; W4 addresses lined up to add with W1
mov 0x1062, W5
LSR W5, #8 ,W5
mov 0x1064, W6
SL W6,#8,W6
mov.b W5,W6 ; W6 addresses lined up to add with W2

add W1,W4,W7
add W2,W6,W8
mov W7, 0x1300
mov W8, 0x1302

done:
  goto     done    ;Place holder for last line of executed code
