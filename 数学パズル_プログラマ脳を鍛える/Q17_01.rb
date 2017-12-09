# 男子と女子を文字で設定
@boy, @girl = "B", "G"

N = 30

def add(seq)
	
	puts "top:", seq	# for Debug

	# 並べる人数に達したら終了
	return 1 if seq.size == N

	# 30人未満の場合、男子を追加するか、右端が男子の場合女子を追加
	cnt = add(seq + @boy)
	puts "above = ", seq	# for debug

	# 右端が男子の場合は分岐が発生するため、cnt += 1でカウント追加
	cnt += add(seq + @girl) if seq[-1] == @boy
	puts "bottom = ", seq	# for debug

	return cnt
end


# 男子から開始のパターン(add boy)と女子から開始パターン(add girl)
# の合計を計算する
puts add(@boy) + add(@girl)

# seqは"B"と"G"の要素からなる配列。文字列配列を扱う時にseq[-1]もOK
