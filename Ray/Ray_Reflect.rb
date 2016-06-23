# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Ray_Reflect.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/22
时间:下午2:13
备注:
=end
require File.join(File.expand_path(".."), '/Entity/Path')
require File.join(File.expand_path(".."), '/Entity/Sign')
require File.join(File.expand_path(".."), '/Loss/Loss_Reflect')
module Ray_Reflect
  def reflect(beginPoint, endPoint, cubeArray, signal)
    p "Module: Ray_Reflect Method: reflect"
    reflectPathArray = Array.new #反射路径数组
    cubeArray.each do |cube|
      cube.plane.each do |plane|
        mirrorPoint = Space_Base.mirrorPoint(beginPoint, plane.equation) #求源点的镜像点
        reflectPoint = Space_Intersect.intersect(mirrorPoint, endPoint, plane)
        pointResult = Space_Intersect.verifyPoint(mirrorPoint, endPoint, reflectPoint)
        if pointResult == 0 then
          if verifyReflectPlane(beginPoint, reflectPoint, cube) == true then
            p "reflectPoint: #{reflectPoint}"
            reflectCubeArray = deleteCube(cube.id, cubeArray)
            preRefractPath = Ray_Refract.refract(beginPoint, reflectPoint, reflectCubeArray, signal)
            preRefractSignal = preRefractPath[0]
            inReflectAngle = Space_Base.linePlaneAngle(beginPoint,reflectPoint,plane.equation)
            reflectSignalValue = Loss_Reflect.reflect(preRefractSignal,signal.frequency,inReflectAngle,plane)
            reflectSignal = Sign.new
            reflectSignal.id = signal.id
            reflectSignal.strength = reflectSignalValue
            reflectSignal.frequency = signal.frequency
            nextRefractPath = Ray_Refract.refract(reflectPoint, endPoint, reflectCubeArray, reflectSignal)
            reflectDelay = preRefractPath[1]+nextRefractPath[1]
            reflectSignalValue = nextRefractPath[0]
            reflectPointArray = preRefractPath[2]+nextRefractPath[2]
            reflectPath = [reflectSignalValue, reflectDelay, reflectPointArray]
            reflectPathArray.push(reflectPath)
          end
        end
      end
    end
    return reflectPathArray
  end

  module_function :reflect

  #判断反射面的有效性
  def verifyReflectPlane(beginPoint, reflectPoint, cube)
    p "Module: Ray_Reflect Method: verifyReflectPlane"
    cube.plane.each do |plane|
      interPoint = Space_Intersect.intersect(beginPoint, reflectPoint, plane)
      pointResult = Space_Intersect.verifyPoint(beginPoint, reflectPoint, interPoint)
      if pointResult == 0 then
        return false
      end
    end
    return true
  end

  module_function :verifyReflectPlane

  #删除当前的物体
  def deleteCube(id, cubeArray)
    p "Module: Ray_Reflect Method: deleteCube"
    cubeArray.each do |cube|
      if cube.id == id
        cubeArray.delete(cube)
        break
      end
    end
    return cubeArray
  end

  module_function :deleteCube
end