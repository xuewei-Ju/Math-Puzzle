
# このプログラムの前提条件はフィボナッチの一覧を用意してある。
# 且つ、fib関数を外からコールする部分がどこかである

# これはフィボナッチ数を求めるプログラム

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
