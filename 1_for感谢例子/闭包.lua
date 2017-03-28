function iter_list( t )
	local i = 0
	local n = table.getn(t)
	return function()
		i = i + 1
		print( "i=", i )
		if i<= n then
			return t[i]
		end
	end
end

fFunc = iter_list( {"a", "b"} )
print( fFunc() )
print( fFunc() )
print( fFunc() )
print( fFunc() )