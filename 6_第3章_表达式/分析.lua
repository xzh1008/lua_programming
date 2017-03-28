1、表达式： 常量、变量、运算符、函数调用等组成  eg:  1 + a + b + func( c )

2、 运算符： 算术运算符(+ - * / ^)、关系运算符( > < >= <= ~= )、逻辑运算符( and or not )

3、通过引用比较tables、userdata、functions
	eg：	
		a = {}
		b = {}
		c = a
		a == c but a ~= b

4、and or 运算的结果不是 true 或 false, 而是和两个操作数相关
	eg: a and b    a为真时，返回b; a为假时，返回a
	    a or b     a为真时，返回a; a为假时，返回b

	注意应用   （and） or (and) or ...
	( level < 3 and 3 ) or ( level < 5 and 5  ) or 12


	not 运算结果为 true 或 false

5、表构造 {}
	要赋值先定义空表

	key为字符串时
	定义：  a = {}   a.x = 1    a.y = 2  <-->    a = {}   a["x"] = 1    a["y"] = 2    <-->   a = {x =1, y =2}     <-->   a = {["x"] = 1, ["y"] = 2}    
	字符串为key，可以用  . 和 [""] 获取, 注意   .  后面的字符串不用加 “”

	key为数时：
	定义：  a = {}  a[2] = 2 <--> a = {[2] = 2}
	获取：只能用 []


	每次调用构造函数，Lua 都会创建一个新的 table


	表构造一个链表
	list = nil
	for _, value in pairs( { 2,3,4 } ) do 
		list = { ["next"] = list, ["value"] = value }
	end

	l = list
	while l do
		print( l.value )
		l = l.next
	end


