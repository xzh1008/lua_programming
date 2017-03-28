function list_iter(t)
    local i = 0
    local n = table.getn(t)
    -- _s为状态常量，其值是迭代工厂返回的第二个值，这里就是 "我是状态常量"
    -- _var为控制变量，第一次是迭代工厂返回的第三个值，后续是闭包运行返回的第一个值
    return function ( _s, _var )
    	print( "状态常量：", _s )
    	print( "控制量：", _var )
        i = i + 1
        if i <= n then return t[i] end
    end, "我是状态常量", "我是初始的控制变量"
end

for e in list_iter( {"a"} ) do
	print(e)
end