-- defines a factorial function
function fact( n )
	if n == 0 then
		return 1
	end
	return n*fact( n-1 )
end