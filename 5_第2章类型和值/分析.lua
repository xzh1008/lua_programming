1、8个基本类型： nil、boolean、number、string、table、function、userdata、thread

userdata: 用户数据，将 C 数据存放在 Lua 变量中（例如c中的结构体），eg: cocos2dx创建的精灵对象
thread： 线程，协同中使用

可用 函数 type测试 变量或值的类型

print( type( nil ) )
print( type( false ) )
print( type( 1 ) )
print( type( "1" ) )
print( type( {} ) ) 
print( type( print ) )


2、控制结构的条件中除了 false 和 nil 为假，其他值都为真（0和空字符串也为真）

3、转义字符  \
' " [  ]  \ 需要转义
\数字   变成  一个字母

4、
字符串，用‘’或“”，也可以用 [[ ]],可以包含多行，可以嵌套，且不会解释转义序列，如果第一个是换行符，会自动忽略掉
[[
a                    
]]

第一个换行符会被忽略掉，剩下a和一个换行

5、 一个字符串使用算术操作符时，string 就会被转成数字

6、.. 字符串连接符号，当在一个数字后面写..时，必须加上空格以防止被解释错
-- 错误
print( 1.. 3 )


