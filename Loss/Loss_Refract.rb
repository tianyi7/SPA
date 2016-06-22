# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Loss_Refract.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/21
时间:上午10:39
备注:
=end
module Loss_Refract
  def refract(signalValue, frequency, material, angle)
    return signalValue-10
  end

  module_function :refract
end
