-- ȫ�ֱ���x
x = 10
local i = 1
while i<=x do
	-- �����xΪwhile����ľֲ�����
	-- iΪ����chunk�ľֲ�����
	local x = i*2
	print( x )  --> 2,4,6,8,...
	i = i + 1
end

-- ����i��ֵΪ10
if i > 20 then
	local x
	x = 20
	print( x + 2 )
else
	print( x ) --> 10  (ȫ�ֱ���x)
end

print( x )   --> 10( ȫ�ֱ���x )


i = 1
repeat
	i = i + 1
	print(i)
-- ���������˳�ѭ��
until i > 0