# encoding:utf-8
=begin
函数名：intersect
输入：直线起点和终点的坐标数组
     平面四个凸点坐标数组
     平面方程系数数组
输出：直线和平面相交点坐标数组
     如果直线和平面平行，返回起点坐标数组
     如果直线和平面交点不在平面内，或者不在直线两个端点之内，返回终点坐标数组
=end
def intersect(beginPoint,endPoint,planeCoordinate,plane)

    x1,y1,z1 = beginPoint
    x2,y2,z2 = endPoint#直线起点和终点坐标赋值
    (u1,v1,w1),(u2,v2,w2),(u3,v3,w3),(u4,v4,w4) = planeCoordinate #平面凸点坐标赋值
    a,b,c,d = plane #平面方程系数赋值
    l,m,n = x2-x1,y2-y1,z2-z1 #计算方向向量
    r = l*a+m*b+n*c
    intersectPoint = [x1,y1,z1] #设置默认返回

    #直线和平面垂直则返回直线起点坐标
    if r == 0 then
        return intersectPoint
    end

    t = (a*x1+b*y1+c*z1+d)*1.0/(a*x2+b*y2+c*z2+d)#系数t计算,注意乘以1.0,否则取整数
    #直线和平面相交点计算结果坐标
    x,y,z = (x1-t*x2)/(1-t),(y1-t*y2)/(1-t),(z1-t*z2)/(1-t)
    #如果相交坐标在平面外，返回直线终点坐标
    intersectPoint = [x2,y2,z2]

    if x>u1&&x>u2&&x>u3&&x>u4 then
        return intersectPoint
    end

    if x<u1&&x<u2&&x<u3&&x<u4 then
        return intersectPoint
    end

    if y>v1&&y>v2&&y>v3&&y>v4 then
        return intersectPoint
    end

    if y<v1&&y<v2&&y<v3&&y<v4 then
        return intersectPoint
    end

    if z>w1&&z>w2&&z>w3&&z>w4 then
        return intersectPoint
    end

    if z<w1&&z<w2&&z<w3&&z<w4 then
        return intersectPoint
    end
    #相交点在直线两个端点外直接返回终点坐标
    if x>x1&&x>x2 then
        return intersectPoint
    end

    if x<x1&&x<x2 then
        return intersectPoint
    end

    if y>y1&&y>y2 then
        return intersectPoint
    end
    if y<y1&&y<y2 then
        return intersectPoint
    end

    if z>z1&&z>z2 then
        return intersectPoint
    end

    if z<z1&&z<z2 then
        return intersectPoint
    end

    #通过全部合法性测试，相交点在平面内
    intersectPoint = [x,y,z]
    return intersectPoint
end

