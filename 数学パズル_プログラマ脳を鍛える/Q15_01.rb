# 階段で立ち話

N = 4		# 階段の段数
STEPS = 2	# 一気に進める段数

def move(a, b)
	return 0 if a > b	# AさんがBさんよりも上になれば終了
	return 1 if a == b	# 同じ段に止まればカウント

	cnt = 0

	(1..STEPS).each{|da|
		(1..STEPS).each{|db|
			# for debug
			print da, " ", db, " ", a+da," ", b-db, "\n"
			cnt += move(a + da, b - db)	# 再帰的に探索
		}
	}

	# ここは深い階層から浅い階層に戻るときに、cnt変数が定義
	# されず、エラーになることを防ぐためのステートメント
	# さらに、ここでputs cntのような出力してもだめ。なぞ…
	# 推測だが、ここは深い階層の変数を浅い階層に使えるように
	# その値を保存するためのステートメント（宣言ではない）
	cnt
	
end


# Aさんは0の位置から、BさんはNの位置からスタート
puts move(0, N)