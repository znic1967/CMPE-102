; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; midterm.s - Midterm Practice
; *************************************************************

; Variables
.bss
 u16_i: .space 2
 u16_j: .space 2
 u16_k: .space 2
; Assembly Code
; =============
.text
.global __reset
__reset:
    mov #1, u16_i
    mov #2, u16_j
    mov #3, u16_k
    mov u16_i, W1
    mov u16_j, W2
    mov u16_k, W3
    mov #80,W4
    
    ;u16_i<u16_k
    cp W1, W3
    bra GEU, else_body ;if i>=k goto else
    cp W2,W4 ;j!=80
    bra LT, else_body
    if_body: ;if both compares dont branch then execute if statement
    else_body:
	goto done


done:
  goto     done    ;Place holder for last line of executed code
