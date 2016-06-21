# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Propagate.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/18
时间:下午4:32
备注:
=end
require File.join(File.expand_path(".."), '/Space/intersect')
require File.join(File.expand_path(".."), '/Space/verifyPoint')
require File.join(File.expand_path(".."), '/Delay/delay')
require File.join(File.expand_path(".."), '/Loss/directLoss')
require File.join(File.expand_path(".."), '/Entity/Sign')
require File.join(File.expand_path(".."), '/Entity/Plane')
require File.join(File.expand_path(".."), '/Space/distance')
require File.join(File.expand_path(".."), '/Space/SPA_Space')
require File.join(File.expand_path(".."), '/Space/SPA_Space')
module Propagate
  #直射
  def direct(beginPoint, endPoint, planeArray, singal)
    directPoint = [beginPoint, endPoint] #交点数组
    pointNumber = directPoint.length
    planeArray.each do |plane|
      interPoint = intersect(beginPoint, endPoint, plane.point, plane.equation) #求直线和平面交点
      pointResult = verifyPoint(beginPoint, endPoint, interPoint) #计算交点
      if pointResult == 1 then
        return 1 #无直射路径返回1
      end
    end
    directDelay = delay(directPoint, pointNumber) #计算时延
    directDistance = distance(directPoint, pointNumber) #计算距离
    directLossValue = directLoss(singal.strength, singal.frequency, directDistance) #计算损耗
    directPath = [directLossValue, directDelay, directPoint] #直射路径数组
    return directPath
  end

  module_function :direct

  def refract(beginPoint, endPoint, cubeArray, singal)
    directPath = direct(beginPoint, endPoint, [], singal) #计算直射的路径数组
    refractLossValue = directPath[0] #直射损耗设置为折射初始损耗值
    refractDelay = directPath[1] #直射时延
    refractPointArray = [beginPoint]
    cubeArray.each do |cube|
      tempRefractPointArray = Array.new
      cube.plane.each do |plane|
        interPoint = intersect(beginPoint, endPoint, plane.point, plane.equation) #求直线和平面交点
        pointResult = verifyPoint(beginPoint, endPoint, interPoint) #计算交点
        if pointResult == 0 then
          tempRefractPointArray.push(interPoint)
        end
      end
      pointDistance1 = SPA_Space.pointDistance(beginPoint,tempRefractPointArray[0])
      pointDistance2 = SPA_Space.pointDistance(beginPoint,tempRefractPointArray[1])
      if pointDistance1<pointDistance2 then
        
      end
    end
    #按照距离排序
    pointDistanceHash.sort
  end

  module_function :refract

  def reflect(beginPoint, endPoint, cubeArray, singal)

  end
end

