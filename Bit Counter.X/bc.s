; ========================================
; Zack Nicholson
; Professor Nguyen
; CMPE 102-02
; 9 October 2017
; ========================================
    
    
; *************************************************************
; bc.s - Bit Counter
; *************************************************************
    
    
; Variable Declarations
;=====================
.bss
; Reserve one word (16 bits) for each variable with ``.space`` directive.
u8_i:   .space 2
u8_j:   .space 2
u8_k:   .space 2

; Assembly Code
; =============
.text
.global __reset
__reset:

;Initialization
 mov #0xE2, W0
 mov.b WREG, u8_j
 clr WREG
 mov.b WREG, u8_i
 mov.b WREG, u8_k
 mov u8_i, W1
 
 ;Loop Code
 Loop_Begin:
 cp W1, #8 ;Check initial condition u8_i !=8
 bra Z, Loop_End ; if counter has hit all 8 bits, end loop.
 btsc u8_j,#0 ; Skip next line in lsb of u8_j is 0
    inc.b u8_k ; Increment if u8_j = 1
 lsr.b u8_j ; Shift right to look at next bit
 inc u8_i
 mov u8_i, W1 ; Copy u8_i to W1 to be used in compare
 goto Loop_Begin
 Loop_End:
    mov u8_j, W2 ; move variables to register to see contents
    mov u8_k,  W3
    goto done
    
done:
