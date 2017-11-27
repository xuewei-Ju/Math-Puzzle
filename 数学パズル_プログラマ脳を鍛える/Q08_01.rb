
N = 12

def move(log)
	# 最初の位置を含んで、N+1個調べれば終了
	return 1 if log.size == N + 1

	cnt = 0

	# 前後左右に移動
	[[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|

		# ここのd[0],d[1]は２次元配列のd[x, y]のx位置とy位置だ
		# ２次元配列と１次元配列と足し算について、
		# １次元配列のx,y位置はそれぞれ２次元配列のx,y位置と計算
		next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
	
		# 探索済みでなければ移動させる
		# next_posに位置パターンを記録されている
		if !log.include?(next_pos) then
			cnt += move(log + [next_pos])
		end

		# debug用
		#print "next_pos = ", next_pos
		#print "  log = ", log
		#print "  d = ", d, "\n"
	}

	cnt
end


puts move([[0, 0]])

