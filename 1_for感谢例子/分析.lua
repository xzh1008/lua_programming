又翻起了programming in lua 这本书了，而且又看到 感谢贡献之人，今天就对这段代码做下分析。代码如下：
-- file: 'thanks.lua'
-- desc: to print the list of the contributing guys
function list_iter(t)
    local i = 0
    local n = table.getn(t)
    return function ()
        i = i + 1
        if i <= n then return t[i] end
    end
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
for e in list_iter( helpful_guys ) do
    print(e)
end


对于这段代码，我们分两个部分来讲，第一部分是闭包，第二部分是范式for的运行过程

首先先讲闭包，简单一点说，闭包就是 一个内部函数，它可以访问一个或多个外部函数的外部局部变量
结构：包含两个函数，一个是闭包自己，一个是工厂（创建闭包的函数）

-- 这里list_iter函数是创建闭包的工厂
function list_iter( t )
    local i = 0
    local n = table.getn( t )
    -- 匿名函数，list_iter函数的返回值
    return function ()
    	-- 变量i和n相对于这个匿名函数，是个外面的局部变量
        i = i + 1
        if i <= n then return t[i] end
    end
end

先看下上面的list_iter函数，它的返回值是一个函数，这个函数保存着三个外部的局部变量i，n和t
大家想一下：

fFunc = list_iter( {"a", "b"} )
这里的返回值就是一个函数 它保存了三个值，i=0, n=2， t={"a", "b"}
对fFunc函数运行一下 即fFunc()
输出结果为 a

因为 fFunc 它是一个函数，运行的时候
i=i+1 这时i=0+1=1
t[1] 就是 a

运行完之后，出了一个结果，同时这个fFunc的局部变量i=1

同理再运行一下 fFunc时，
输出的结果为 b
同时，fFunc这个函数的局部变量i变为2

这时候再运行一下的时候，结果就是nil, 因为
i=2+1  --- 3
i<=n不成立了

所以接下来运行的时候，结果都是为nil,
但是没运行一次的时候，fFunc这个闭包的局部变量i就会加1


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


接下来讲一下范式for的运行过程
其语法如下
for <var-list> in <exp-list> do
	<body>
end

其中 
<var-list> 是一个或多个以逗号分割的变量名列表
<exp-list> 是一个或多个以逗号分割的表达式列表，迭代函数（闭包），状态常量和控制变量
通常情况下 exp-list 只有一个值：迭代工厂的调用。 即： iter_list() 其返回值是一个闭包


do
	-- _f为迭代函数，_s为状态常量，_var为控制变量
	local _f, _s, _var = explist
	while true do
		-- 迭代函数的参数有两个
		-- 第一个是状态常量_s, 这个值是运行迭代工厂的时候返回的第二个参数
		-- 第二个是控制常量，第一次的值是运行迭代工厂的时候返回的第三个参数，后面是上次运行闭包返回的第一个返回值
		local var_1, ... , var_n = _f( _s, _var )
		-- 接下来闭包的第二个参数，变成上一次运行闭包返回的第一个值
		_var = var_1
		if _var == nil then 
			break 
		end
		block
	end
end

上面的解释可能一开始看不懂，没关系，接下来根据实例来说明一下，这里用最开始那个感谢的函数来说明：


function list_iter(t)
    local i = 0
    local n = table.getn(t)
    return function ()
        i = i + 1
        if i <= n then return t[i] end
    end
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

-- 这里 in 后面的结果，我们希望是一个迭代函数，一个状态常量，一个控制常量
-- 但是这里是 list_iter( helpful_guys )
-- 也就是说 local _f, _s, _var = list_iter( helpful_guys )的返回值
-- 因为list_iter只有一个返回值，所以这里的三个变量分别为
-- _f 为闭包， _s = nil, _var = nil
for e in list_iter( helpful_guys ) do
	-- 第一次运行_f的时候，返回值是helpful_guys的第一个元素；"----参与翻译----"
	-- 根据上面分析for的运行过程，可知，这里就是一直运行_f函数，直到其返回值为nil就就结束
    print(e)
end

上面的 
for e in list_iter( helpful_guys ) do
	print( e )
end

等价于
_f, _s, _var = list_iter( helpful_guys )
for e in _f, _s, _var do
	print( e )
end


运行的_f的过程中，其实是有传入状态常量_s，和后续变化的控制变量_var,只是这里闭包函数没有参数而已


我们可以修改一下迭代工厂，就可以看到状态常量_s和控制变量_var



function list_iter( t )
    local i = 0
    local n = table.getn( t )
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