-- ����Ŀ¼
package.path = package.path .. ";F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\require\\?"
print( package.path )

-- �Ѽ���ģ����
for name, obj in pairs( package.loaded ) do
    print( name, obj )     
end



-- ��LuaEditor(v6.30) ����������
-- require( "a.lua" )
require( "F:\\ProjectSimple\\Programming_in_lua\\loadfile_dofile_require\\require\\a.lua" )

