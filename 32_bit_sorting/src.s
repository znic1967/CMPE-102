; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; 32 Bit Sorting Program
; *************************************************************
; Reserve one word (16 bits) for each variable with ``.space`` directive.

; Assembly Code
; =============
.text
.global __reset
__reset:

; Initialize memory
mov #0x0008, W0
mov W0, 0x1000
mov #0x8000, W0
mov W0, 0x1002
mov #0x0005, W0
mov W0, 0x1004
mov #0x5000, W0
mov W0, 0x1006
mov #0x0001, W0
mov W0, 0x1008
mov #0x1000, W0
mov W0, 0x100A
mov #0x0004, W0
mov W0, 0x100C
mov #0x4000, W0
mov W0, 0x100E
mov #0x000A, W0
mov W0, 0x1010
mov #0xA000, W0
mov W0, 0x1012
mov #0x000C, W0
mov W0, 0x1014
mov #0xC000, W0
mov W0, 0x1016
mov #0x0009, W0
mov W0, 0x1018
mov #0x9000, W0
mov W0, 0x101A
mov #0x0000, W0
mov W0, 0x101C
mov #0x0000, W0
mov W0, 0x101E
mov #0x000E, W0
mov W0, 0x1020
mov #0xE000, W0
mov W0, 0x1022
mov #0x000E, W0
mov W0, 0x1024
mov #0x3000, W0
mov W0, 0x1026
mov #0x0008, W0
mov W0, 0x1028
mov #0x8000, W0
mov W0, 0x102A
mov #0x0002, W0
mov W0, 0x102C
mov #0x2000, W0
mov W0, 0x102E
    
;Sort Loop

; W1:  counter to track # of swaps
; W2:  address of LSW of entry n
; W3:  address of LSW of entry n+1
; W6: content of LSW of entry n
; W8: content of LSW of entry n+1
; W10: address of last element in list
    
l_begin:
    mov #0,W1
    mov #0x1000,W2
    mov #0x1004,W3
    mov #0x102C,W10
l_check:
    mov.d [W2], W6 ;W7 = MSW, W6= LSW
    mov.d [W3], W8 
    cp W7,W9 ;if n MSW< n+1 MSW
    bra LTU, l_next ;MSWn<MSWn+1 no swap. If MSW bigger must swap
    bra GTU, l_swap ; so the program doesn't skip swap when MSW bigger but LSW less
    cp W6,W8
    bra LTU, l_next ;LSWn<LSWn+1 no swap. If LSW bigger must swap
l_swap:
    mov.d W6, [W3]
    mov.d W8, [W2]
    inc W1, W1 ;counter++. Counter keeps track of swaps
l_next:
    cp W3, W10 ;at last address 
    bra Z, end_check
    nxt:
	add #4,W2 ;W2=n+1
	add #4,W3 ;W4=n+2
	goto l_check
    end_check:
	cp0 W1
	bra Z, l_done
	goto l_begin ;if at last address but we did swaps restart loop.
l_done:
    goto l_done
