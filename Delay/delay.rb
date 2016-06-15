# encoding:utf-8
=begin
函数名：delay
输入：一条路径数组
     路径中点的数目
输出：传播时间
功能：计算传播时延
作者：刘洋
日期：2016.6.13
备注：无
=end
include Math
def delay(path,n)
  #可以设计成全局变量,提出一个变量模块
  speed = 300000000
  len = 0.0
  for i in 0..n-2
    len = len + length(path[i],path[i+1])
    p len
  end
  time = len/speed
  return time;
end

#计算距离,可以提出工具类
def length(beginPoint,endPoint)
  x1,y1,z1 = beginPoint
  x2,y2,z2 = endPoint
  length = Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1))
  return length
end

