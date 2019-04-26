.data
	array : .word 1, 6, 9, 4, 5, 5, 4, 5, 21, 4, 31, 4, 88, 4, 6324, -45, 4, -4, 67
	size : .word 19
	element : .word 4

.text
	main:
la $s0, element
lw $s0, 0($s0)				# element
la $s1, size				
lw $s1, 0($s1)				# size
la $s2, array				# array address

jal search					# search function called

move $a0, $v0				# moving counter
li $v0, 1
syscall						# print counter

li $v0, 10					# terminate
syscall

	search:
li $t0, 0					# counter
li $v0, 0

	loop:
beq $t0, $s1, end
lw $t1, 0($s2)
addi $s2, $s2, 4			# next word address
addi $t0, $t0, 1			# increase loop counter
beq $s0, $t1, inc_counter	# inc counter if equal
j loop

	inc_counter:
add $v0, $v0, 1
j loop

	end:
jr $ra