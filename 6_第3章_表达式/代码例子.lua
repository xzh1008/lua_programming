a = {}
b = {}
c = a
-- 地址引用比较
print( "a==b", a==b )
print( "a==c", a==c )

-- and or 返回的结果为两个操作数
print( "4 and 5", 4 and 5 )
print( "4 or 5", 4 or 5 )


-- 表构造出list
list = nil
-- 反序形成链表
for _, value in pairs( { 2,3,4 } ) do 
	list = { ["next"] = list, ["value"] = value }
end

-- 输出
l = list
while l do
	print( l.value )
	l = l.next
end	