# 覆面演算問題

expression = "READ+WRITE+TALK==SKILL"

# 文字で区切り（アルファベット以外の文字列で分割）
# numsは単語ごとの要素の配列になる (puts nums)
nums = expression.split(/[^a-zA-Z]/)

# charsはアルファベット文字ごとの要素の配列になる(puts chars)
chars = nums.join().split("").uniq


# 初期化
head = nums.map{|num| num[0]}

count = 0

# seqは0～9の10文字のあらゆる順序の組み合わせ
(0..9).to_a.permutation(chars.size){|seq|
	is_zero_first = false
	
	# 最初の数字が0かを判定
	if seq.include?(0) then	
		is_zero_first = head.include?(chars[seq.index(0)])
	end

	# 最初は0以外の場合だけ対象とする
	if !is_zero_first then
		# expressionの文字列に対して、charsをseqに置き換え、
		e = expression.tr(chars.join(), seq.join())

		# 出来上がった計算式をevalで評価する（trueかfalseか）
		if eval(e) then
			puts e
			count += 1
		end
	end
}

puts count

# permutationメソッドは、配列から引数n個の要素を選んだときの順列
#（順序あり、重複を許さない組合せ）を数え上げます

# mapメソッドは、要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を
# 集めた配列を作成して返します。

# trメソッド(str.tr(from_str, to_str))は、文字列の中で引数from_strに
# 並べた文字を引数to_strに並べた文字に置き換え、新しい文字列を返します