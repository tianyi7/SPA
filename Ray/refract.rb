# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: refract.rb
功能:绕射计算
输入:
输出:
作者:刘洋
日期:16/6/15
时间:上午10:30
备注:透射面顺不同,折射直射算两遍
=end
require File.join(File.expand_path(".."),'/Ray/direct')
require File.join(File.expand_path(".."),'/Loss/refractLoss')
require File.join(File.expand_path(".."), '/Space/SPA_Angle')
def refract(beginPoint,endPoint,planeArray,singal)
  directPath = direct(beginPoint,endPoint,singal) #计算直射的路径数组
  refractLossValue = directPath[0] #直射损耗设置为折射初始损耗值
  refractDelay = directPath[1] #直射时延
  refractPointArray = [beginPoint]
  planeNumber = planeArray.length
  planeArray.each do |plane|
    refractPoint = intersect(beginPoint,endPoint,plane.point,plane.equation) #求直线和平面交点
    pointResult = verifyPoint(beginPoint,endPoint,refractPoint) #计算交点
    if pointResult == 1 then
      planeNumber = planeNumber - 1
      next
    else
      refractPointArray.push(refractPoint) #折射点压入反射数组
      refractAngle = SPA_Angle.angle(beginPoint,refractPoint,plane.equation) #计算折射角度
      refractLossValue = refractLoss(refractLossValue,singal.frequency,plane.material,refractAngle) #计算折射的损耗值
    end
  end
  if planeNumber == 0 then
    return directPath #无折射情况,返回直射数组
  else
    refractPointArray.push(endPoint)
    refractPath = [refractLossValue,refractDelay,refractPointArray] #折射路径数组
    return refractPath
  end
end



=begin
#测试数据
#空间面方程文件名
beginPoint = [0,0,0]
endPoint = [0,0,8]
singal = Sign.new
singal.strength = 100
plane1 = Plane.new
plane1.equation = [0,0,1,-1]
plane1.point = [[10,10,1],[10,-10,1],[-10,10,1],[-10,-10,1]]
plane1.material = 1
plane2 = Plane.new
plane2.equation = [0,0,1,-2]
plane2.point = [[10,10,2],[10,-10,2],[-10,10,2],[-10,-10,2]]
plane2.material = 1
planeArray = Array.new
planeArray.push(plane1)
planeArray.push(plane2)
p refract(beginPoint,endPoint,planeArray,singal)
=end
