# �K�i�ŗ����b

N = 10		# �K�i�̒i��
STEPS = 4	# ��C�ɐi�߂�i��

@memo = {}

def move(a, b)
	return @memo[[a,b]] if @memo.has_key?([a,b])

	return @memo[[a,b]] = 0 if a > b	# A����B����ɂȂ�ΏI��
	return @memo[[a,b]] = 1 if a == b	# �����i�Ɏ~�܂�΃J�E���g

	cnt = 0

	(1..STEPS).each{|da|
		(1..STEPS).each{|db|
			cnt += move(a + da, b - db)	# �ċA�I�ɒT��
		}
	}

	@memo[[a, b]] = cnt
end


# A�����0�̈ʒu����AB�����N�̈ʒu����X�^�[�g
puts move(0, N)
