# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: distance.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/15
时间:上午9:45
备注:
=end
include Math
def distance(path,n)
  #可以设计成全局变量,提出一个变量模块
  len = 0.0
  for i in 0..n-2
    len = len + length(path[i],path[i+1])
  end
  return len;
end

#计算距离,可以提出工具类
def length(beginPoint,endPoint)
  x1,y1,z1 = beginPoint
  x2,y2,z2 = endPoint
  length = Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1))
  return length
end