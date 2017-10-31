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
u32_i:   .space 4
u32_j:   .space 4
u32_k:   .space 4

; Assembly Code
; =============
.text
.global __reset
__reset:

;Initialization
; mov u32_i, W0
; mov u32_j, W1
; and W0,W1,W2
; mov u32_i+2,W0
; mov u32_i+2,W1
; and W0,W1, W2
; bra Z, if_body
; goto done
; if_body:
;    mov #0xCFAB, W1
;    mov #0x0489, W0
;    mov u32_i, W2
;    and W2,W0,W3
;    mov u32_i+2,W2
;    and W2,W1,W3
;    mov W3, u32_i
 while_body:
    mov u32_k, W4
    lsr u32k+2 // u32_k
    rrc u32_k
    //u32_j--
    clr W0
    dec u32_k
    sub u32_l+2
    //Break case
    mov u32_i,W0
    mov u32_i,W2
    cp W0,W1
    bra Z, goto done
    goto while_body
done:
