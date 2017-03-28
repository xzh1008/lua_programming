-- 可以访问没有初始化的全局变量
print( b )  -- nil
b = 10
print( b ) -- 10

--删除全局变量，只要赋值为nil
b = nil