cnt = 0

(0..2).each{|coin500|  # 500�~�ʂ͍ő�Q��
	(0..10).each{|coin100| # 100�~�ʂ͍ő�10��
		(0..15).each{|coin50|  # 50�~�ʂ͍ő�15��
			(0..15).each{|coin10| # 10�~�ʂ͍ő�15��
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
