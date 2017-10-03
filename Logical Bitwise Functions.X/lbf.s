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
  mov #0xAB90, W1 ; Value 1
  mov W1, value1 
  mov #0x12CD, W2 ; Value 2
  mov W2, value2 
  mov #0xFF00, W3 ; mask for bits 15-8
  mov #0x00FF, W4 ; mask for bits 7-0
  and W1,W3, W6 ; use W6 for result 1
  and.b W2,W4, W6 ; add LSB of value 2 to W5.
  mov W6, result1 
  ;Result 1 in
  
  mov W6, W7
  btg W7, #1 ;toggle oall odd bits of result1
  btg W7, #3
  btg W7, #5
  btg W7, #7
  btg W7, #9
  btg W7, #11
  btg W7, #13
  btg W7, #15
  mov W7, result2
  ;result 2 in
done:
  goto     done    ;Place holder for last line of executed code
