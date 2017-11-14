# m‚ÍlAn‚Í–_‚Ì’·‚³

def cutbar(m, n, current) # current‚ÍŒ»İ‚Ì–_‚Ì”

	if current >= n then
		0 # Ø‚èI‚¦‚½
	elsif current < m then
		1 + cutbar(m, n, current * 2) # Ÿ‚ÍŒ»İ‚Ì‚Q”{‚É‚È‚é
	else
		1 + cutbar(m, n, current + m) # ‚Í‚³‚İ‚Ì”‚¾‚¯’Ç‰Á
	end

end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
