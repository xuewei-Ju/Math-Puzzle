
# ���̃v���O�����̓t�B�{�i�b�`��������Ă���B

a = b = 1

count = 0

# count�ϐ��̓t�B�{�i�b�`�̐��𐔂�����́B
# �t�B�{�i�b�`���{�̂ł͂Ȃ�
while (count < 11) do
	c = a + b
	
	# 1�����ɕ������Ċe���̘a���擾
	sum = 0

	# ��؂蕶���̎w��ł�"//"�Ƃ��Ă��邪�A�P�������̈Ӗ�
	c.to_s.split(//).each {|e| sum += e.to_i}
	
	if (c % sum == 0) then
		# ����؂ꂽ�ꍇ�ɏo�͂���
		puts c
		count += 1
	end
	
	a, b = b, c
end
