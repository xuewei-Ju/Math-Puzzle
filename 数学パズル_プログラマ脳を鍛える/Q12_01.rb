# �����������܂ޏꍇ
i = 1

while i += 1
	# �����_���������A������10�������擾
	str = ('%10.10f'%Math.sqrt(i)).sub('.','')[0..9]
	# sub���\�b�h�̎g�����Fstr.sub(pattern, replacement)

	# �d������菜����10�����Ȃ�I��
	break if str.split('').uniq.length == 10

end

puts i

# ���������݂̂̏ꍇ
i = 1

while i += 1

	# �����_�ŕ������A���������݂̂��擾
	str = ('%10.10f'%Math.sqrt(i)).split('.')[1]

	# ���������̏d������菜����10�����Ȃ�I��
	break if str.split('').uniq.length == 10

end

puts i
