N = 30

boy, girl = 1, 0

N.times{|i|
	# n-1�l�܂ŕ���ł����Ԃ��狁�߂�
	boy, girl = boy + girl, boy
}

puts boy + girl
