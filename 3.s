.data
	str : .byte 'i', 'i', 't', 't', 'i', 'r', 'u', 'p', 'a', 't', 'i'
	size : .word 11

.text

main:
	la $s0, str				# string starting address
	addi $s1, $s0, 10		# string ending address
	la $t0, size
	lw $t0, 0($t0)			# size
	li $t1, 2
	div $t0, $t1
	mflo $t0				# size/2
	jal reverse

reverse:
	li $t1, 0				# loop counter

loop:
	beq $t1, $t0, end
	addi $t1, $t1, 1
	lb $t2, 0($s0)
	lb $t3, 0($s1)
	sb $t3, 0($s0)
	sb $t2 0($s1)
	addi $s0, $s0, 1
	addi $s1, $s1, -1
	j loop

end:
	jr $ra	