a = {}
b = {}
c = a
-- ��ַ���ñȽ�
print( "a==b", a==b )
print( "a==c", a==c )

-- and or ���صĽ��Ϊ����������
print( "4 and 5", 4 and 5 )
print( "4 or 5", 4 or 5 )


-- �����list
list = nil
-- �����γ�����
for _, value in pairs( { 2,3,4 } ) do 
	list = { ["next"] = list, ["value"] = value }
end

-- ���
l = list
while l do
	print( l.value )
	l = l.next
end	