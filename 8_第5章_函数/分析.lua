函数：
	1、语法:
		function func_name( arguments-list )
			statements-list
		end

		用途：1、函数调用（完成指定任务） 2、计算并返回值（赋值语句的表达式使用）


	2、调用函数时，只有一个参数，且参数为字符串或者是表构造时，()为可选项

	eg: requeire "a.lua"
		print "a"
		print {}


	3、函数的实参和形参的匹配和赋值语句类似，多于部分去除，少于部分补nil
	eg: function f( a, b ) return a or b end
		f(1)  -- a=1, b=nil
		f(1,2)  -- a=1, b=2
		f(1,3)  -- a=1, b=2 , 3被忽略


	4、
	当作为表达式调用函数，作为最后一个参数，或者仅有一个参数时，尽可能多的返回多个值，不足补nil。其他情况下，只返回第一个值。 
		eg:     a, b, c = f(), 2

	作为函数参数被调用时，和多值赋值一样（和上面一样）。
		eg： print( f(), 2)          

	在表构造函数中初始化，和多值赋值一样（和上面一样）。
		eg:     {f(), 2}

	return f()  返回f()的所有返回值。如果return 函数后，还有其他值，则只返回一个值

	return f(), 1

	函数被圆括号 （）括住，强制返回一个值
		eg: print( ( f() ) )


	5、unpack 实现
	function unpack( t, i )
		i = i or 1
		if t[i] then
			return t[i], unpack( t, i+1 )
		end
	end

	6、可变参数 ... 
	function f( ... ) 
		-- 可变参数在函数中存在一个arg的表中，表结构为{n = 参数个数; 参数1，参数2， ...}
		print( unpack( arg ) )
	end

	7、命名参数：调用时，实参会顺序依次传给形参。如果要用名字指定参数，可定义一个,参数可以为一个表，这就可以通过key，访问。可以做参数校验等，后面再调用实际实现功能的操作
	这样不用担心参数顺序传反了
	function rename ( arg )
		return os.rename(arg.old, arg.new)
	end


	
