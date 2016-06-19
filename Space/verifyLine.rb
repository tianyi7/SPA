# encoding:utf-8
=begin
函数名：verifyLine
输入：源点坐标、场点坐标、反射点坐标、平面类对象数组
输出：是否为真
功能：计算源点-反射点、场点-反射点两条线与平面方程组是否相交
作者：刘洋
日期：2016.3.22
备注：无
=end
require File.join(File.expand_path(".."),'/Space/line')
require File.join(File.expand_path(".."),'/Space/intersect')
require File.join(File.expand_path(".."),'/Space/mirrorPoint')
require File.join(File.expand_path(".."),'/Space/verifyPoint')
def verifyLine(beginPoint,endPoint,reflectPoint,planeArray,reflectPlane)
  planeNum = planeArray.size#计算面方程数组中面的数量
  #遍历面方程判断反射与原点、场点连线是否与面相交
  planeArray.each {|plane|
    if plane.equation[0]==reflectPlane[0]&&plane.equation[1]==reflectPlane[1]&&plane.equation[2]==reflectPlane[2]&&plane.equation[3]==reflectPlane[3] then
      planeNum = planeNum -1
      next
    end
    beginReflectPoint = intersect(beginPoint,reflectPoint,plane.point,plane.equation)
    beginReflectPointResult = verifyPoint(beginPoint,reflectPoint,beginReflectPoint)
    if beginReflectPointResult == 0 then
      #break
    end

    endReflectPoint = intersect(endPoint,reflectPoint,plane.point,plane.equation)
    endReflectPointResult = verifyPoint(endPoint,reflectPoint,endReflectPoint)
    if endReflectPointResult == 0 then
      break
    end
    planeNum = planeNum -1
  }
  #全部平面遍历结束，判断是否有平面相交
  if planeNum == 0 then
    return 0
  else
    return 1
  end
end
