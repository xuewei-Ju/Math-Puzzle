
# ���[�v���Ă��邩�`�F�b�N
def is_loop(n)

	# �ŏ���3��������1�𑫂�
	check = n * 3 + 1

	# 1�ɂȂ�܂Ő�����ω������邱�Ƃ��J��Ԃ�
	while check != 1 do
		check = check.even? ? check / 2 : check * 3 + 1
		return true if check == n
	end

	return false

end

# 2�`10000�܂ŁA�����ɂ��ă`�F�b�N����
puts 2.step(1000, 2).count{|i|
	is_loop(i)
}

# Integer.even? -> bool ���g�������ł���ΐ^��Ԃ��B�����łȂ��ꍇ�͋U��Ԃ��B

# �O�����Z�q: [�Z��] ? true���ʂ̏��� : false���ʂ̏���
