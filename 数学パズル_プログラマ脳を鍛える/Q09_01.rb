boy, girl = 20, 10

# �l����+1�̗��R�͎��ۂ̐l����0����v�Z���ׂ�����ł��B
# 20�l�̏ꍇ�A0�`20��21�ʂ�̃p�^�[�����l���Ȃ��Ƃ����Ȃ��B
boy, girl = boy + 1, girl + 1

# �S�v�f��0�ɏ�����
ary = Array.new(boy * girl){0}

ary[0] = 1

# �����̃A���S���Y���͗L���Ȍo�H�����x�[�X�ɍl����
# �i�q��̓������A��ԍ����̊i�q�����ԉE��̊i�q�ɍs���ɂ͉��ʂ肪���邩
# �̌v�Z�ɂ��āA�e�i�q�̒ʂ萔�͍��i�q�̐����Ɖ��i�q�̐����̘a�ɂȂ�B
# ����̖���11X21�̕��i�q�̐}�������A�j�������̊i�q�������i�O�Ƃ���j�A
# ��ԉE��̊i�q�̐��������߂�΂悢�B

girl.times{|g|
	boy.times{|b|
		if (b != g) && (boy - b != girl - g) then  # �j�������̊i�q�͌v�Z���Ȃ�
			# ���̊i�q�̐����𑫂��Z
			ary[b + boy * g] += ary[b - 1 + boy * g] if b > 0
			# print "ary[", b+boy*g, "]= ", ary[b+boy*g], "\n"

			# ���̊i�q�̐����𑫂��Z
			ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
			print "arg[", b+boy*g, "]= ", ary[b+boy*g], "\n"
		end
	}
}

print "ary[-boy - 1]=", ary[-boy-1]
print "ary[-2]=", ary[-2], "\n"

# -2�͈�ԉE��̊i�q�̍����̊i�q�A-1-boy�͈�ԉE��̊i�q�̉����̊i�q
# ruby��-1�������̗v�f�A-2�͖����v�f��1�O�̗v�f
# -boy-1�͈�Ԗ����̗v�f���P�s���̗v�f�����炷�v�Z
puts ary[-2] + ary[-boy - 1]
