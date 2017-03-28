-- 可以访问没有初始化的全局变量
print( b )  -- nil
b = 10
print( b ) -- 10
--删除全局变量，只要赋值为nil
b = nil



print( type( nil ) )
print( type( false ) )
print( type( 1 ) )
print( type( "1" ) )
print( type( {} ) ) 
print( type( print ) )

print( "\\a" )
-- 不会解释转义序列
print( [[\\\n]] )


-- 一个字符串使用算术操作符时，string 就会被转成数字
print( "10" + 1 )
-- hello不能转数字，会报错
-- print( "hello" + 2 )

-- .. 字符串连接符号，当在一个数字后面写..时，必须加上空格以防止被解释错
print( 1 .. 2 )

-- 报错数字后面 加 .. 时 必须加上空格
-- print( 1.. 2 )
