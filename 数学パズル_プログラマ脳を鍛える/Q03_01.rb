# �J�[�h�̏�����
N =100

cards = Array.new(N,false)

# 2�`N�܂ŗ��Ԃ�
(2..N).each{|i|

  # Ruby�̔z���0����n�܂�B���Ԃ��͂P���ڂ���Ȃ̂ŁAj=2-1=1
	j = i - 1
	while (j < cards.size) do
		cards[j] = !cards[j]
		j += i
	end
}

# �������̃J�[�h���o��
N.times{|i|
  # �z��0����n�܂邽�߁A���ۂ̏o�͂�+1
	puts i + 1 if !cards[i]
}

