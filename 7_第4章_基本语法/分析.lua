基本语法：赋值语句，控制结构体语句，函数调用，多变量赋值，局部变量声明

1、多值赋值：
	变量和值个数不一致值：多于部分去除，少于部分补nil
	a,b,c=0,1
	print(a,b,c)  -->  0 1 nil

	a,b = a+1, b+1, b+2 -- b+2的值被忽略
	print(a,b)    --> 1 2

	赋值语句会先计算右边所有的值，然后再执行赋值，所以可以进行交换变量
	x, y = y, x

2、控制结构语句
	if: 三种形式
		if conditions then
			then-part
		end

		if conditions then
			then-part
		else
			else-part
		end

		if conditions then
		elseif
			elseif-part
		.. --多个elseif	
		else
			else-part
		end

	-- 满足条件执行 statements
	-- 不满足时，结束循环
	-- 可理解为不满足条件式，不执行循环语句，即执行循环外语句
	while conditions do
		statements
	end

	-- 顾名思义（重复xx,直到满足条件为止） 如果不满足conditions，重复statements（会先执行一次）
	-- 满足时，结束循环
	repeat 
		statements
	-- 可理解为，满足条件时，执行下一句，即循环外语句
	until conditions




3、局部变量与代码块（block）
	局部变量只有在声明的那个代码块有效
	代码块：控制结构体内，函数体


	好处：避免命名冲突
		  访问局部变量比全局变量快

	block划定明确的界限：do ... end

4、for 两大类
	数值for循环

	for var=exp1,exp2,exp3 do
		loop-part
	end

	exp1：初始值
	exp2: 终止值
	exp3: 步数，默认为 1

	exp1, exp2, exp3 三个表达式只会表计算异常，并且是在循环开始前

	for 语句中，控制变量var是局部变量，自动被声明
     循环过程中，不要修改局部变量，那样做的话，结果是不可预知的

	范型for：
    范型for遍历迭代子函数返回的每一个值


 5、 break, return
 	return,break只能出现在block的结尾一句（显示使用do ... end），做chunk的最后一句，或者在end之前，或者在else之前，或者until之前，可以显示使用do...end



 	没有continue的原因
	repeat ... until contidition 
	contidition 表达式中的变量可以是repeat until代码块内声明的局部变量
	所以：

	local a = 1
	repeat 
		if f() then
			continue            
		end
	  	local a = 0
	  	...
	until a == 0

	由于continue会跳过后面local a = 1的声明，那么 until a == 0 到底是指内部的local a还是外部的a就会有歧义了！

	而c++中 do ... while contidtion  的condition  不允许出现do while内部声明的临时变量，必须是do while外部声明的变量



