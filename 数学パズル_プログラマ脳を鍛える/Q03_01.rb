# カードの初期化
N =100

cards = Array.new(N,false)

# 2～Nまで裏返す
(2..N).each{|i|

  # Rubyの配列は0から始まる。裏返しは１枚目からなので、j=2-1=1
	j = i - 1
	while (j < cards.size) do
		cards[j] = !cards[j]
		j += i
	end
}

# 裏向きのカードを出力
N.times{|i|
  # 配列が0から始まるため、実際の出力も+1
	puts i + 1 if !cards[i]
}

