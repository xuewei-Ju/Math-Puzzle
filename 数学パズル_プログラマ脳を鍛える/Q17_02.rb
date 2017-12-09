N = 30

boy, girl = 1, 0

N.times{|i|
	# n-1l‚Ü‚Å•À‚ñ‚Å‚¢‚éó‘Ô‚©‚ç‹‚ß‚é
	boy, girl = boy + girl, boy
}

puts boy + girl
