# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Loss_Reflect.rb
功能:
输入:
输出:
作者:刘洋
日期:16/6/22
时间:下午3:03
备注:
=end
module Loss_Reflect
  def reflect(signalValue)
    return signalValue-20
  end

  module_function :reflect
end
