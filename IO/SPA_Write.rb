# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: SPA_Write.rb
功能:写文件模块
输入:
输出:
作者:刘洋
日期:16/6/17
时间:下午9:51
备注:
=end
module SPA_Write
  #创建日志文件
  def createFile(mode)
    time = Time.new
    if mode == 1
      #Windows环境路径
      @@file = File.new(File.expand_path("..")+'\\Log\\log'+time.year.to_s+time.month.to_s+time.day.to_s+".txt", "w+")
    else
      #OS X环境路径
      @@file = File.new(File.expand_path("..")+'//Log//log'+time.year.to_s+time.month.to_s+time.day.to_s+".txt", "w+")
    end
  end
  module_function :createFile

  #基本写文件函数
  def baseWrite(note,content)
      @@file.syswrite(note+" "+content+"\n")
  end
  module_function :baseWrite

  #数组写文件函数
  def arrayWrite(array)
    array.each do |arr|
      @@file.syswrite("\n")
    end
  end
  module_function :arrayWrite

end