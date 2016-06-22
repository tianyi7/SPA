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
require File.join(File.expand_path(".."),'/IO/SPA_Read')
require File.join(File.expand_path(".."),'/IO/SPA_Write')
require File.join(File.expand_path(".."),'/Data/Data_Convert')
require File.join(File.expand_path(".."),'/Ray/Ray_Refract')
require File.join(File.expand_path(".."),'/Ray/Ray_Reflect')

def rayTracing
  p "rayTracing"
  #创建日志文件,OSX环境
  SPA_Write.createFile(2)
  #数据文件名
  planeFile = File.expand_path("..")+"/Doc/Space.txt";
  neFile = File.expand_path("..")+"/Doc/NetElement.txt";
  ueFile = File.expand_path("..")+"/Doc/UserEquipment.txt";
  singalFile = File.expand_path("..")+"/Doc/Signal.txt";
  #获取数据
  planeArray = SPA_Read.plane(planeFile)
  neArray = SPA_Read.ne(neFile)
  ueArray = SPA_Read.ue(ueFile)
  singalArray = SPA_Read.signal(singalFile)
  beginPoint = neArray[0].coordinate
  endPoint = ueArray[0].coordinate
  singal = Sign.new
  singal.strength = 100
  #平面数据转换成物体数据
  cubeArray = Data_Convert.planeToCube(planeArray)
  #reflectPointArray = reflect(beginPoint,endPoint,planeArray,singal)
  #直射计算
  #directPath = Propagate.direct(beginPoint,endPoint,[],singal)
  #绕射计算
  #refractPath = Propagate.refract(beginPoint,endPoint,cubeArray,singal)
  #refractPath2 = refract(beginPoint,endPoint,planeArray,singal)
  #反射计算
  reflectPath = Ray_Reflect.reflect(beginPoint,endPoint,cubeArray,singal)
  SPA_Write.pathWrite(reflectPath)
  return reflectPath
end

p rayTracing

