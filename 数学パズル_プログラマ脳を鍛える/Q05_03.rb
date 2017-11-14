
@cnt = 0

def change(target, coins, usable)

	coin = coins.shift
	if coins.size == 0 then
		@cnt += 1 if target / coin <= usable
	else
		(0..target/coin).each{|i|
			change(target - coin * i, coins.clone, usable - i)
		}
	end

end

change(1000, [500, 100, 50, 10], 15)

puts @cnt

# shiftメソッドは、配列の最初の要素を削除し、その要素を返す

# cloneメソッドは、レシーバのオブジェクトのコピーを作成して返す。オブジェクトのコピーとは、同じ内容を持つ別のオブジェクトである。
