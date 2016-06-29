# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Data_Review.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/24
时间:上午8:49
备注:
=end
module Data_Review
  def cubeArray(cubeArray)
    cubeArray.each do |cube|
      p "module:Data_Review method:cubeArray 物体平面数量: "+cube.plane.length.to_s
    end
  end

  module_function :cubeArray

  def cube(cube)
    p "module:Data_Review method:cube 物体平面数量: "+cube.plane.length.to_s
  end

  module_function :cube
end