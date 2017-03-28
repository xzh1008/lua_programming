-- 全局变量x
x = 10
local i = 1
while i<=x do
	-- 这里的x为while里面的局部变量
	-- i为整个chunk的局部变量
	local x = i*2
	print( x )  --> 2,4,6,8,...
	i = i + 1
end

-- 这里i的值为10
if i > 20 then
	local x
	x = 20
	print( x + 2 )
else
	print( x ) --> 10  (全局变量x)
end

print( x )   --> 10( 全局变量x )


i = 1
repeat
	i = i + 1
	print(i)
-- 满足条件退出循环
until i > 0