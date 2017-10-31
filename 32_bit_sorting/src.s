; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; 32 Bit Sorting Program
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

mov #0008, W0
done:
  goto     done    ;Place holder for last line of executed code
