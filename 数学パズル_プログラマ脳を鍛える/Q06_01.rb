
# ループしているかチェック
def is_loop(n)

	# 最初は3をかけて1を足す
	check = n * 3 + 1

	# 1になるまで数字を変化させることを繰り返す
	while check != 1 do
		check = check.even? ? check / 2 : check * 3 + 1
		return true if check == n
	end

	return false

end

# 2～10000まで、偶数についてチェックする
puts 2.step(1000, 2).count{|i|
	is_loop(i)
}

# Integer.even? -> bool 自身が偶数であれば真を返す。そうでない場合は偽を返す。

# 三項演算子: [算式] ? true結果の処理 : false結果の処理
