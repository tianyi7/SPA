# encoding:utf-8
=begin
函数名：reflect
输入：源点坐标、场点坐标、平面类对象数组
输出：反射点坐标数组
功能：计算一次反射的反射点
作者：刘洋
日期：2016.3.20
备注：无
=end
require File.join(File.expand_path(".."), '/Entity/Plane')
require File.join(File.expand_path(".."), '/Space/line')
require File.join(File.expand_path(".."), '/Space/intersect')
require File.join(File.expand_path(".."), '/Space/mirrorPoint')
require File.join(File.expand_path(".."), '/Space/verifyPoint')
require File.join(File.expand_path(".."), '/Space/verifyLine')
require File.join(File.expand_path(".."), '/Ray/refract')
require File.join(File.expand_path(".."), '/Loss/reflectLoss')

def reflect (beginPoint, endPoint, planeArray, singal)
  #定义存储反射点的数组
  reflectPointArray = Array.new
  #定义反射路径
  reflectPath = Array.new
  #定义反射路径数组
  reflectPathArray= Array.new
  #遍历每个面求反射点
  planeArray.each do |plane|
    mirrorPoint = mirrorPoint(beginPoint, plane.equation) #求源点的镜像点
    reflectPoint = intersect(mirrorPoint, endPoint, plane.point, plane.equation) #求反射点
    pointResult = verifyPoint(beginPoint, endPoint, reflectPoint) #计算反射点
    #判断反射点合法性
    if pointResult == 1 then
      next
    else
      reflectAngle = SPA_Angle.angle(beginPoint, reflectPoint, plane.equation) #计算反射角度
      beforeRefractPath = refract(beginPoint, reflectPoint, planeArray, singal);
      refrectLossValue = reflectLoss(beforeRefractPath[0], singal.frequency, plane.material, reflectAngle)
      afterRefractPath = refract(reflectPoint, endPoint, planeArray, singal)
      reflectPath = [afterRefractPath[0], beforeRefractPath[1]+afterRefractPath[1], beforeRefractPath[2]+afterRefractPath[2]]
      reflectPathArray.push(reflectPath)
      p beforeRefractPath
      p afterRefractPath
    end
    return reflectPathArray
  end
end






=begin
反射方法老版本
def reflect (beginPoint,endPoint,planeArray)
  #定义存储反射点的数组
  reflectPointArray =  Array.new
  #遍历每个面求反射点
  planeArray.each do |plane|
    mirrorPoint = mirrorPoint(beginPoint,plane.equation) #求源点的镜像点
    reflectPoint = intersect(mirrorPoint,endPoint,plane.point,plane.equation) #求反射点
    pointResult = verifyPoint(beginPoint,endPoint,reflectPoint) #计算反射点
    #判断反射点合法性
    if pointResult == 1 then
      next
    end
    lineResult = verifyLine(beginPoint,endPoint,reflectPoint,planeArray,plane.equation)
    if lineResult == 0 then
      reflectPointArray.push(reflectPoint)
    else
      next
    end
  end
  return reflectPointArray
end
=end
