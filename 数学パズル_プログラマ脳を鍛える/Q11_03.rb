
# ���̃v���O�����̑O������̓t�B�{�i�b�`�̈ꗗ��p�ӂ��Ă���B
# ���Afib�֐����O����R�[�����镔�����ǂ����ł���

# ����̓t�B�{�i�b�`�������߂�v���O����

@memo = {}

def fib(n)
	return @memo[n] if @memo.has_key?(n)

	if (n == 0) || (n == 1) then
		@memo[n] = 1
	else
		@memo[n] = fib(n - 1) + fib(n - 2)
	end
end


puts fib(6)
