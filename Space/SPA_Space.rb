# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: SPA_Space.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/18
时间:下午5:20
备注:
=end
include Math

module SPA_Space
  #两点之间的距离
  def pointDistance(beginPoint,endPoint)
    x1,y1,z1 = beginPoint
    x2,y2,z2 = endPoint
    length = Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1))
    return length
  end
  module_function :pointDistance
end


