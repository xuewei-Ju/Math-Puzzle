cnt = 0

(0..2).each{|coin500|  # 500â~ã ÇÕç≈ëÂÇQñá
	(0..10).each{|coin100| # 100â~ã ÇÕç≈ëÂ10ñá
		(0..15).each{|coin50|  # 50â~ã ÇÕç≈ëÂ15ñá
			(0..15).each{|coin10| # 10â~ã ÇÕç≈ëÂ15ñá
				if coin500 + coin100 + coin50 + coin10 <= 15 then
					if coin500 * 500 + coin100 * 100 +
						 coin50 * 50 + coin10 * 10 == 1000 then
						cnt += 1
					end
				end
			}
		}
	}
}

puts cnt
