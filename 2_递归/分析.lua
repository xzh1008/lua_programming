-- defines a factorial function
function fact( n )
	-- 递归结束情况
	if n == 0 then
		return 1
	end
	-- fact( n ) = n * fact( n-1 )
	return n*fact( n-1 )
end

递归的主要两点
1、递归结束情况
2、f(n) 与f(n-1)的关系

f(n) = 1*2*3*...*n
f(n-1) = 1*2*3*...*(n-1)
f(n) = n*f(n-1)



练习：(递归实现)
1+2+3+...+n
f(n) = f(n-1) + n

