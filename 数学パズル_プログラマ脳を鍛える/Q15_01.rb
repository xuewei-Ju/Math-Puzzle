# �K�i�ŗ����b

N = 4		# �K�i�̒i��
STEPS = 2	# ��C�ɐi�߂�i��

def move(a, b)
	return 0 if a > b	# A����B���������ɂȂ�ΏI��
	return 1 if a == b	# �����i�Ɏ~�܂�΃J�E���g

	cnt = 0

	(1..STEPS).each{|da|
		(1..STEPS).each{|db|
			# for debug
			print da, " ", db, " ", a+da," ", b-db, "\n"
			cnt += move(a + da, b - db)	# �ċA�I�ɒT��
		}
	}

	# �����͐[���K�w����󂢊K�w�ɖ߂�Ƃ��ɁAcnt�ϐ�����`
	# ���ꂸ�A�G���[�ɂȂ邱�Ƃ�h�����߂̃X�e�[�g�����g
	# ����ɁA������puts cnt�̂悤�ȏo�͂��Ă����߁B�Ȃ��c
	# ���������A�����͐[���K�w�̕ϐ���󂢊K�w�Ɏg����悤��
	# ���̒l��ۑ����邽�߂̃X�e�[�g�����g�i�錾�ł͂Ȃ��j
	cnt
	
end


# A�����0�̈ʒu����AB�����N�̈ʒu����X�^�[�g
puts move(0, N)