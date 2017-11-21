; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; Compare and Swap Subroutine
; *************************************************************
   
; Variable Declarations
;=====================
.bss
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
; W8: Loop Counter to track # of swaps
; W0: address of LSW of entry n
; W1: address of LSW of entry n+1
; W2: holds 1 if swap occured
; W3: addresss of last element of array

l_begin:
    mov #0,W8
    mov #0x1000,W0
    mov #0x1004,W1
    mov #0x102C,W3
l_check:
    call cmp_and_swap
    btsc W2,#0 ;skip next line if W2=0
    inc W8, W8 ;W8++
    add #4,W0 ;W2=n+1
    add #4,W1 ;W4=n+2
    cp W1, W3 ;at last address 
    bra Z, end_check
    goto l_check
    end_check:
	cp0 W8 ; if no swaps occured then list is sorted
	bra Z, l_done
	goto l_begin ;if at last address but we did swaps restart loop.
l_done:
    goto l_done
    
cmp_and_swap:
    push W8
    push W9
    push W10
    push W11
    mov #0, W2
    mov.d [W0],W8 ;W9 = MSW, W8= LSW
    mov.d [W1],W10 ;W11 = MSW, W10= LSW
    cp W9,W11 ;if n MSW< n+1 MSW
    bra LTU, l_exit ;MSWn<MSWn+1 no swap. If MSW bigger must swap
    bra GTU, l_swap ; so the program doesn't skip swap when MSW bigger but LSW less
    cp W6,W8
    bra LTU, l_exit ;LSWn<LSWn+1 no swap. If LSW bigger must swap
    l_swap:
	mov.d W8,[W1]
	mov.d W10,[W0]
	mov #1,W2

    l_exit:
	pop W11
	pop W10
	pop W9
	pop W8
	return