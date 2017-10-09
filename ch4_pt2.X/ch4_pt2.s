; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; lbf.s - Logical Bitwise Functions
; *************************************************************
; Variable Declarations
;=====================
.bss
; Reserve one word (16 bits) for each variable with ``.space`` directive.
value1:   .space 2
value2:   .space 2
result1:   .space 2
result2:   .space 2

; Assembly Code
; =============
.text
.global __reset
__reset:

  ;; Initialize with student ID values
  mov #0x0804, W0
  mov #0x0806, W1
  mov #0x8301, W2 
  mov #0xF0A2, W3
  mov #0xFFFF, W4 
  
  mov #0x382A, W5 
  mov W5, 0x1000 
  mov #0xFB80, W5 
  mov W5,0x1002 
  mov #0x80FF, W5 
  mov W5, 0x1004 
  mov #0x7B03, W5 
  mov W5,0x1006 
  mov #0x0001, W5 
  mov W5, 0x1008 
  
  ; Start of problems 
  add W4, W2, W0
  sub.b W4,W2, W2
  rlc.b 0x1003
  rrnc.b 0x1000
  
done:
  goto     done    ;Place holder for last line of executed code----