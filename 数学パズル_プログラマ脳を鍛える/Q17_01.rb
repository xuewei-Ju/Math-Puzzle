# �j�q�Ə��q�𕶎��Őݒ�
@boy, @girl = "B", "G"

N = 30

def add(seq)
	
	puts "top:", seq	# for Debug

	# ���ׂ�l���ɒB������I��
	return 1 if seq.size == N

	# 30�l�����̏ꍇ�A�j�q��ǉ����邩�A�E�[���j�q�̏ꍇ���q��ǉ�
	cnt = add(seq + @boy)
	puts "above = ", seq	# for debug

	# �E�[���j�q�̏ꍇ�͕��򂪔������邽�߁Acnt += 1�ŃJ�E���g�ǉ�
	cnt += add(seq + @girl) if seq[-1] == @boy
	puts "bottom = ", seq	# for debug

	return cnt
end


# �j�q����J�n�̃p�^�[��(add boy)�Ə��q����J�n�p�^�[��(add girl)
# �̍��v���v�Z����
puts add(@boy) + add(@girl)

# seq��"B"��"G"�̗v�f����Ȃ�z��B������z�����������seq[-1]��OK
