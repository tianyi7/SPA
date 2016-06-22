# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Ray_Direct.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/21
时间:下午3:47
备注:
=end
module Ray_Direct
  def direct(beginPoint, endPoint, singal)
    directPointArray = [beginPoint, endPoint] #交点数组
    pointNumber = directPointArray.length
    directDelay = Space_Base.pathDelay(directPointArray, pointNumber) #计算时延
    directDistance = Space_Base.pathDistance(directPoint, pointNumber) #计算距离
    directLossValue = Loss_Direct.direct(singal.strength, singal.frequency, directDistance) #计算损耗
    directPath = [directLossValue, directDelay, directPoint] #直射路径数组
    return directPath
  end

  module_function :direct
end