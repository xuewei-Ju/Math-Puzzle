
# ���t������Date�N���X��Ǎ�
require 'date'

# ���o�Ώۂ̊��Ԃ�ݒ�
term = Date.parse('19461010')..Date.parse('20200724')

# ���l��
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# �����������ʂ������l�ɂȂ���̂��o��
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}



# Date.parse�͗^����ꂽ���t�\������͂��A���̏��Ɋ�Â��ē��t�I�u�W�F�N�g�𐶐�����

# ������format������ɏ]���ĕ�����ɕϊ��������ʂ�Ԃ�

# map���\�b�h�́A�v�f�̐������J��Ԃ��u���b�N�����s���A�u���b�N�̖߂�l���W�߂��z����쐬���ĕԂ��B

# to_s���\�b�h�́A�����𕶎���ɕϊ����܂��B����base�ɐ��l��n���ƁA���i���Ƃ��ĕ\�������w��ł��܂��B�f�t�H���g��10�i���ł�

