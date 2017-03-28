t = loadfile( "F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\loadfile\\a.lua" )

-- loadfile不会抛出异常，返回nil,和错误码。可用assert捕获异常
print( loadfile("a.lua") )
print( type( t ) )
-- a.lua编译未运行，test没定义
-- test()
print( "end" )
t()
test()

