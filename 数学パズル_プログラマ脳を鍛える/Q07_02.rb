# ���t������Date�N���X��Ǎ�
require 'date'

# �Ώۂ̊��ԂŁA2�i����5�����ڂ���8�����𒊏o
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left = 20200724.to_s(2)[4,8].to_i(2)

# ���E��8���������[�v
from_left.upto(to_left){|i|
	l = "%08b" % i    # ����
	r = l.reverse     # �E��

	(0..1).each{|m|   # ����
		value = "1001#{l}#{m}#{r}1001"

		begin
			puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
			rescue        # �L���ȓ��t�ȊO�͖���
		end
	}

}

# rescue �́H
