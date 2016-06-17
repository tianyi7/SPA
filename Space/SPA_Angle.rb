# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: SPA_Angle.rb
功能:计算直线与平面的角度
输入:起点坐标、终点坐标、平面方程数组
输出:角度
作者:刘洋
日期:16/6/14
时间:
备注:
=end
include Math
module SPA_Angle

  #计算线面夹角
  def angle(beginPoint, endPoint, plane)
    x1, y1, z1 = beginPoint
    x2, y2, z2 = endPoint
    m, n, p = x2-x1, y2-y1, z2-z1
    a, b, c = plane
    n = PI/2-asin((a*m+b*n+c*p).abs/(Math.sqrt(a*a+b*b+c*c)*Math.sqrt(m*m+n*n+p*p)))
    return n
  end

  module_function :angle

  def refractAngle(inAngle,planeMaterial)
    outAngle = Math.asin((Math.sin(inAngle)*1.0/n))
  end

  module_function :refractAngle
  end