# ���[���h�J�b�v�o�ꍑ��z��ɃZ�b�g
@country = ["Brazil", "Croatia", "Mexico", "Cameroon",
            "Spain", "Netherlands", "Chile", "Australia",
            "Colombia", "Greece", "Cote d'Ivoire", "Japan",
            "Uruguay", "Costa Rica", "England", "Italy",
            "Switzerland", "Ecuador", "France", "Honduras",
            "Argentina", "Bosnia and Herzegovina", "Iran",
            "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia",
            "Korea Republic"]

# �g�p�ς݂����`�F�b�N
@is_used = Array.new(@country.size, false)

def search(prev, depth)
	is_last = true

	@country.each_with_index{|c, i|
		if c[0] == prev[-1].upcase then
			if !@is_used[i] then
				is_last = false

				# �ċA�I�ɒT������O�Ƀt���O���Z�b�g
				@is_used[i] = true

				search(c, depth + 1)

				# �ċA�I�ɒT�����I���΃t���O�����ɖ߂�
				@is_used[i] = false
			end
		end
	}

	@max_depth = [@max_depth, depth].max if is_last
end


# ���ׂĂ̍�����J�n
@max_depth = 0

@country.each_with_index{|c, i|

	# �ċA�I�ɒT������O�Ƀt���O���Z�b�g
	@is_used[i] = true

	search(c, i)

	# �ċA�I�ɒT�����I���΃t���O�����ɖ߂�
	@is_used[i] = false
}


# �[���̍ő�l�i����Ƃ�ő������̐��j��\��
puts @max_depth
