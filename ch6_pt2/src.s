; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; Chapter 6 Part 1 Homework Checker
; *************************************************************
; Reserve one word (16 bits) for each variable with ``.space`` directive.

; Assembly Code
; =============
.text
.global __reset
__reset:


;;W0=psz_1, W1=psz_2, W2=u8 char
;    str_swap:
;	cp0.b [W0]  ;*psz_1!=0
;	bra Z, str_swap_exit
;	mov.b [W0], W2 ; u8 char=*psz_1
;	mov.b [W1],[W0] ;*psz_1 = *psz_2
;	mov.b W2, [W1++] ;*psz_2 = u8_char, psz2++
;	inc W0,W0 ;psz1++
;	bra str_swap
;    str_swap_exit:
;	return
    
;W0=u16_k, W1=u8_i, W2=u8_j
    u16_swap:
	mov W1, W0 ;u16_k=pu16_x[u8_i]
	mov W2, W1 ;pu16_x[u8_i] = pu16_x[u8_j]
	mov W0, W2 ;pu16_x[u8_j] = u16_k
	return
	
; Find Max Subroutine
; W0 = pi16_a, W1 = u8_cnt, W2 = i16_k
    find_max:
	mov #0x8000, W2	    ; i16_k=-32768
    find_max_loop_top:
	cp0.b W1
	bra Z, find_max_exit
	cp W2, [W0]	    ; i16_k < *pi16_a
	bra GE, find_max_skip ;signed compare
	mov [W0], W2	    ; i16_k = *pi16_a
    find_max_skip:
	inc2 W0,W0	    ;pi16_a++
	dec.b W1, W1	    ;u8_cnt
	bra find_max_loop_top
    find_max_exit:
	mov W2,W0	    ; set return value
	return		    ; W0=pi16_a, W1=u8_cnt, W2=i16_k
