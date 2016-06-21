# encoding:utf-8
=begin
函数名：line
输入：起点坐标数组
      终点坐标数组
输出：空间线方程数组
功能：计算两点之间的线方程
=end
def line(beginPoint,endPoint)
    x1,y1,z1 = beginPoint
    x2,y2,z2 = endPoint

    a = (y2-y1)*(z2-z1)
    b = (-1)*(x2-x1)*(z2-z1)
    c = (-1)*(x2-x1)*(y2-y1)
    d = (y2-y1)*(z2-z1)*(-x1)-(x2-x1)*(z2-z1)*(-y1)-(x2-x1)*(y2-y1)*(-z1)
    line = [a,b,c,d]

    return line
end

puts line([1,2,3],[2,6,5])
