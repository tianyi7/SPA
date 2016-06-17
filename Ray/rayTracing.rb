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
require File.join(File.expand_path(".."),'/IO/readPlane')
require File.join(File.expand_path(".."),'/IO/Log')
require File.join(File.expand_path(".."),'/Ray/reflect')
def rayTracing
  $file = File.new(File.expand_path("..")+"\\Log\\log.txt","w+")
  #空间面方程文件名
  filename = File.expand_path("..")+"/Doc/planeArray5.txt";
  planeArray = readPlane(filename)
  beginPoint = [3500,1000,1200]
  endPoint = [2000,10000,2000]
  #beginPoint =[ARGV[0].to_f,ARGV[1].to_f,ARGV[2].to_f]
  #endPoint = [ARGV[3].to_f,ARGV[4].to_f,ARGV[5].to_f]
  singal = Sign.new
  singal.strength = 100
  reflectPointArray = reflect(beginPoint,endPoint,planeArray,singal)
  return reflectPointArray
end

p rayTracing
