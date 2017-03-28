1、loadfile  路径先填绝对路径，注意 \ 的转义 
	顾名思义，只是加载文件，所以只编译，不运行  （不会抛出异常，而是返回nil和错误码）
    编译成中间码，并返回编译后的chunk作为一个函数，而不执行代码
    t = loadfile( "test.lua" )
    t()    执行后才才可以运行

-- a.lua中
print( "loadfile and run success" )
function test()
	print( "hello" )
end

-- b.lua中
t = loadfile( "a.lua" )
-- loadfile不会抛出异常，返回nil,和错误码。可用assert捕获异常
print( loadfile( "xx.lua" ) )

print( type(t) )    -- function
-- a.lua 编译未但是test函数未定义
-- test()  -- 报错，没有全局变量test
print( "end" )
t()   -- loadfile and run success
test() -- hello

2、loadstring 和 loadfile类似，loadstring用来加载字符串

3、 dofile     会执行（每次dofile都会编译并执行代码）     （可用于编辑器内编辑，编译器上直接dofile文件运行），加绝对路径，或者在主宿主的工作目录下，添加对应的文件
function dofile( sFileName )
	local f = assert( loadfile( sFileName ) )
	return f()
end

-- a.lua
print( "loadfile and run success" )
function test()
	print( "hello" )
end

-- b.lua
dofile( "a.lua" )  -- loadfile and run success
dofile( "a.lua" )  -- loadfile and run success
test() -- hello



4、require   与dofile类似，但是只执行一次         可用 print(package.path) 查看搜索路径，可以添加搜索路径
    package.path = package.path..[[;C:\Users\Admin\Desktop\?.lua]]

    -- 不会重复require,   package.loaded存放已经require的模块
    for name, obj in pairs(package.loaded) do
        print( name )     
    end
