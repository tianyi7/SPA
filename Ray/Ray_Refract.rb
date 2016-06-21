# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Ray_Refract.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/20
时间:下午5:31
备注:
=end
require File.join(File.expand_path(".."), '/Space/Space_Intersect')
require File.join(File.expand_path(".."), '/Space/Space_Base')
module Ray_Refract
  #绕射计算主函数
  def refract(beginPoint, endPoint, cubeArray, singal)
    sortCubeArray = interSortCube(beginPoint, endPoint, cubeArray)
    refractPointArray = Array.new
    sortCubeArray.each do |cube|
      inRefractPoint = Array.new
      outRefractPoint = Array.new
      inPointDistance = 0
      outPointDistace = 0
      cube.plane do |plane|
        interPoint = Space_Intersect.intersect(beginPoint, endPoint, plane)
        pointResult = Space_Intersect.verifyPoint(beginPoint, endPoint, interPoint)
        if pointResult == 0 then

        end
      end
    end
  end


  module_function :refract

  #计算与直线相交的物体,并按照距离排序
  def interSortCube(beginPoint, endPoint, cubeArray)
    cubeHash = Hash.new
    sortCubeArray = Array.new
    cubeArray.each do |cube|
      cube.plane.each do |plane|
        interPoint = Space_Intersect.intersect(beginPoint, endPoint, plane)
        pointResult = Space_Intersect.verifyPoint(beginPoint, endPoint, interPoint)
        if pointResult == 0 then
          pointDistance = Space_Base.pointDistance(beginPoint, interPoint)
          cubeHash[pointDistance] = cube
          break
        end
      end
    end
    cubeHash.sort
    cubeHashArray = cubeHash.to_a
    cubeHashArray.each do |hashArray|
      sortCubeArray.push(hashArray[1])
    end
    return sortCubeArray
  end

  module_function :interSortCube

end