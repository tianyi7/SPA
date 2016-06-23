# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Data_Convert.rb
功能:数据处理模块
输入:
输出:
作者:刘洋
日期:16/6/18
时间:下午6:59
备注:
=end
require File.join(File.expand_path(".."), '/Entity/Cube')
require File.join(File.expand_path(".."),'/IO/SPA_Write')
module Data_Convert
  #平面数组转换成物体数组
  def planeToCube(planeArray)
    p "模块:Data_Conver 方法:planeToCube"
    cubeArray = Array.new
    planeNumber = planeArray.length
    cubeNumber = planeNumber/6
    for i in 0..cubeNumber-1
      cube = Cube.new
      cube.id = 10001+i
      cube.plane = [planeArray[i*6],planeArray[i*6+1],planeArray[i*6+2],planeArray[i*6+3],planeArray[i*6+4],planeArray[i*6+5]]
      cubeArray.push(cube)
    end
    return cubeArray
  end
  module_function :planeToCube

  def pathToSignalPath(pathArray)

  end
  module_function :pathToSignalPath

  def pathToSpacePath(pathArray)

  end
  module_function :pathToSpacePath
end
