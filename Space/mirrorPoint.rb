# encoding:utf-8
=begin
函数名：MirrorPoint
输入：源点坐标数组
     空间面方程参数数组
输出：镜像点坐标数组
功能：计算源点关于平面的镜像点
=end
def mirrorPoint(point,plane)
    x0,y0,z0 = point
    a,b,c,d = plane
    t = -2*(a*x0+b*y0+c*z0+d)/(a*a+b*b+c*c)
    x1 = t*a+x0
    y1 = t*b+y0
    z1 = t*c+z0
    mirrorPoint =[x1,y1,z1]
    return mirrorPoint
end
