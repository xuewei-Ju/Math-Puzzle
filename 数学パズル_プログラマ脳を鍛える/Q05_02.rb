
coin = [10, 50, 100, 500]
cnt = 0

(2..15).each do |i|
	coin.repeated_combination(i).each{|coin_set|
		cnt += 1 if coin_set.inject(:+) == 1000
	}
end

puts cnt


# repeated_combination���\�b�h�́A�z��̗v�f�������n��I�񂾂Ƃ��̏d���g�����i�����Ȃ��A�d���������g�����j�𐔂��グ�܂��B�g�����̐������u���b�N���J��Ԃ����s���A�A�u���b�N����arr�ɑg������z��œ���܂��B

# inject(:+)�͔z��̗v�f�̍��v�����߂�
