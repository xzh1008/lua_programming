t = loadfile( "F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\loadfile\\a.lua" )

-- loadfile�����׳��쳣������nil,�ʹ����롣����assert�����쳣
print( loadfile("a.lua") )
print( type( t ) )
-- a.lua����δ���У�testû����
-- test()
print( "end" )
t()
test()

