1、函数： 带有词法定界的第一类值

	词法定界：被嵌套的函数可以访问他外部函数的变量
	第一类值：和其他值(数字，字符串一样)，可以存在变量中，存在表中，当函数的参数，当函数的返回值等

	function foo() ... end   -->  foo = function() ... end

	将第一类值函数应用在表中是 Lua 实现面向对象和包机制（package，不是闭包）的关键

2、闭包
	函数+它可以正确访问的 upvalues（不是全局变量也不是局部变量，我们称作外部的局部变量）




