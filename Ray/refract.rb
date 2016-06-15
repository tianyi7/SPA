# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: refract.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/15
时间:上午10:30
备注:透射面顺不同,折射直射算两遍
=end
require File.join(File.expand_path(".."),'/Ray/direct')
require File.join(File.expand_path(".."),'/Loss/refractLoss')
require File.join(File.expand_path(".."),'/Space/angle')
def refract(beginPoint,endPoint,planeArray,singal)
  directPath = direct(beginPoint,endPoint,planeArray,singal) #计算直射的路径数组
  refractLossValue = directPath[0] #直射损耗设置为折射初始损耗值
  refractDelay = directPath[1] #直射时延
  refractPointArray = [beginPoint]
  planeArray.each do |plane|
    refractPoint = intersect(beginPoint,endPoint,plane.point,plane.equation) #求直线和平面交点
    pointResult = verifyPoint(beginPoint,endPoint,refractPoint) #计算交点
    if refractPoint == 1 then
      next
    else
      refractPoint.push(refractPointArray) #折射点压入反射数组
      refractAngle = angle(beginPoint,refractPoint,plane.equation) #计算折射角度
      refractLossValue = refractLossValue - refractLoss(refractLossValue,singal.frequency,material,refractAngle) #计算折射的损耗值
    end
  end
  refractPath = [refractLossValue,refractDelay,refractPointArray] #折射路径数组
  return refractPath
end

