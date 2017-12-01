# ���ʉ��Z���

expression = "READ+WRITE+TALK==SKILL"

# �����ŋ�؂�i�A���t�@�x�b�g�ȊO�̕�����ŕ����j
# nums�͒P�ꂲ�Ƃ̗v�f�̔z��ɂȂ� (puts nums)
nums = expression.split(/[^a-zA-Z]/)

# chars�̓A���t�@�x�b�g�������Ƃ̗v�f�̔z��ɂȂ�(puts chars)
chars = nums.join().split("").uniq


# ������
head = nums.map{|num| num[0]}

count = 0

# seq��0�`9��10�����̂����鏇���̑g�ݍ��킹
(0..9).to_a.permutation(chars.size){|seq|
	is_zero_first = false
	
	# �ŏ��̐�����0���𔻒�
	if seq.include?(0) then	
		is_zero_first = head.include?(chars[seq.index(0)])
	end

	# �ŏ���0�ȊO�̏ꍇ�����ΏۂƂ���
	if !is_zero_first then
		# expression�̕�����ɑ΂��āAchars��seq�ɒu�������A
		e = expression.tr(chars.join(), seq.join())

		# �o���オ�����v�Z����eval�ŕ]������itrue��false���j
		if eval(e) then
			puts e
			count += 1
		end
	end
}

puts count

# permutation���\�b�h�́A�z�񂩂����n�̗v�f��I�񂾂Ƃ��̏���
#�i��������A�d���������Ȃ��g�����j�𐔂��グ�܂�

# map���\�b�h�́A�v�f�̐������J��Ԃ��u���b�N�����s���A�u���b�N�̖߂�l��
# �W�߂��z����쐬���ĕԂ��܂��B

# tr���\�b�h(str.tr(from_str, to_str))�́A������̒��ň���from_str��
# ���ׂ�����������to_str�ɕ��ׂ������ɒu�������A�V�����������Ԃ��܂�