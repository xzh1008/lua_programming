function list_iter(t)
	local i = 0
	local n = table.getn( t )
	return function( s, lastValue )
		print(lastValue)
		i = i + 1
		if i<= n then
			return t[i]
		end
	end, 111, 0
end
helpful_guys = {
	"----参与翻译----",
	"buxiu", "凤舞影天", "zhang3",
	"morler", "lambda", "sunlight",
	"\n",
	
	"----参与校对----",
	"凤舞影天", "doyle", "flicker",
	"花生魔人", "zhang3", "Kasi",
	"\n"
}

f, sVar, _var = list_iter( helpful_guys )

for e in f, sVar, _var  do
	print( e )
end

