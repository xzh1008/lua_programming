function list_iter(t)
    local i = 0
    local n = table.getn(t)
    -- _sΪ״̬��������ֵ�ǵ����������صĵڶ���ֵ��������� "����״̬����"
    -- _varΪ���Ʊ�������һ���ǵ����������صĵ�����ֵ�������Ǳհ����з��صĵ�һ��ֵ
    return function ( _s, _var )
    	print( "״̬������", _s )
    	print( "��������", _var )
        i = i + 1
        if i <= n then return t[i] end
    end, "����״̬����", "���ǳ�ʼ�Ŀ��Ʊ���"
end

for e in list_iter( {"a"} ) do
	print(e)
end