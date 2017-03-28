-- 只有一个参数，且参数为字符串或者是表构造时
print "a"
print {}
print [[test]]
-- 错误，参数为数字，()不能省略
--print 2

function f(  )
	return "a", "b"
end

print( "==assign not the last one====" )
a,b = f()  		--> a="a", b="b"
print( a, b)

print( "==assign the last one====" )
a,b = f(), 1 	--> a="a", b=1
print( a, b)

print( "======table =not the last one=====" )
-- 表构造中，不在最后一个参数，f函数返回一个值
for _, value in pairs( {f(), 2} ) do
	print( value )
end

print( "===table =The last one==" )
-- 表构造中，不在最后一个参数，f函数返回一个值
for _, value in pairs( {2, f() } ) do
	print( value )
end

print( "===return add ()==" )
-- 返回值加() 强制返回一个值
print( (f()) )


print( "==variable parameter==" )
function f( ... ) 
	-- 可变参数在函数中存在一个arg的表中，表结构为{n = 参数个数; 参数1，参数2， ...}
	print( unpack( arg ) )
end
f( 1,2,3 )
	
