# 3�{�̕R�ō��l�p�`

MAX = 500

answer = []

(1..MAX/4).each{|c|		# �����`�̈��
	# edge�͒����`�̒��ӂƒZ�ӂ̉\�̒������v�Z���A���̖ʐς�v�f�Ƃ���z��
	# �c�ӂ̒��������܂�����A���� = �R�̒����̔��� - �c�Ӓ���
	edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}

	# for debug
	# puts edge.join(' ')

	edge.combination(2){|a, b|	# �����`�̖ʐ�
		if a + b == c * c then
			answer.push([1, b / a.to_f, c * c / a.to_f])
		end
	}

	# for debug
	# puts answer.join(' ')

}

answer.uniq!		# �����{�����O

puts answer.size


# map���\�b�h�́A�v�f�̐������J��Ԃ��u���b�N�����s���A�u���b�N�̖߂�l��
# �W�߂��z����쐬���ĕԂ��܂�

# combination���\�b�h�́A�z�񂩂����n�̗v�f��I�񂾂Ƃ��̑g����
# �i�����Ȃ��A�d���������Ȃ��g�����j�𐔂��グ�܂��B�g�����̐������u���b�N��
# �J��Ԃ����s���A�u���b�N����arr�ɑg������z��œ���܂��B

# uniq!���\�b�h�́A�z��̒��ŏd������v�f���폜���܂��B

# map��each�Ƃ͈Ⴂ�A�v�f���g���ău���b�N�����s���u���b�N�̖߂�l���W�߂�
# �Ԃ��悤�ɂȂ��Ă���B�܂蒆�Œ�`���� unk ���W�߂��z����쐬���ĕԂ�
# �̂ŃC���N�������g���ꂽ�z�񂪕Ԃ�l�ɂȂ�

# push���\�b�h�́A�z��̖����Ɉ�����v�f�Ƃ��Ēǉ����܂��B