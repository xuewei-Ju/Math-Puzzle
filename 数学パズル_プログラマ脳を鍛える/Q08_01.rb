
N = 12

def move(log)
	# �ŏ��̈ʒu���܂�ŁAN+1���ׂ�ΏI��
	return 1 if log.size == N + 1

	cnt = 0

	# �O�㍶�E�Ɉړ�
	[[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|

		# ������d[0],d[1]�͂Q�����z���d[x, y]��x�ʒu��y�ʒu��
		# �Q�����z��ƂP�����z��Ƒ����Z�ɂ��āA
		# �P�����z���x,y�ʒu�͂��ꂼ��Q�����z���x,y�ʒu�ƌv�Z
		next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
	
		# �T���ς݂łȂ���Έړ�������
		# next_pos�Ɉʒu�p�^�[�����L�^����Ă���
		if !log.include?(next_pos) then
			cnt += move(log + [next_pos])
		end

		# debug�p
		#print "next_pos = ", next_pos
		#print "  log = ", log
		#print "  d = ", d, "\n"
	}

	cnt
end


puts move([[0, 0]])

