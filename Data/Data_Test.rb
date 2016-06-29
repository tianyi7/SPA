# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Data_Test.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/29
时间:下午3:21
备注:
=end
module Data_Test
  def ue(num)
    ueArray = Array.new
    for i in 1..num
      ue = Array.new
      prng = Random.new(i)
      id = 10000+i
      x = prng.rand(0.0...41800.0)
      y = prng.rand(0.0...12400.0)
      z = prng.rand(0.0...7300.0)
      ue =[id,x,y,z]
      ueArray.push(ue)
    end
    return ueArray
  end

  module_function :ue
end

