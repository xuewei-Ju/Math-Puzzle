# m�͐l�An�͖_�̒���

def cutbar(m, n, current) # current�͌��݂̖_�̐�

	if current >= n then
		0 # �؂�I����
	elsif current < m then
		1 + cutbar(m, n, current * 2) # ���͌��݂̂Q�{�ɂȂ�
	else
		1 + cutbar(m, n, current + m) # �͂��݂̐������ǉ�
	end

end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
