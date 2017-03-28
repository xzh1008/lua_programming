-- 搜索目录
package.path = package.path .. ";F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\require\\?"
print( package.path )

-- 已加载模块名
for name, obj in pairs( package.loaded ) do
    print( name, obj )     
end



-- 在LuaEditor(v6.30) 运行有问题
-- require( "a.lua" )
require( "F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\require\\a.lua" )

