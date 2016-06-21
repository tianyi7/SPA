# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: SPA_Loss.rb
功能:损耗计算模块
输入:
输出:
作者:刘洋
日期:16/6/20
时间:下午3:49
备注:
=end
module SPA_Loss

  def direct(signalValue, frequency, distance)
    return signalValue-5
  end
  module_function :direct

  def reflect(signalValue, frequency, distance, angle)
    return signalValue-20
  end
  module_function :reflect

  def refract(signalValue,frequency,material,angle)
    return signalValue-10
  end
  module_function :refract

end
