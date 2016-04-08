module Log
  def recordLog(log,className,methodName,arg,*args)
    log.puts "CLass/Moudle:"+className
    log.puts "method:"+methodName
  end
  module_function :recordLog
  def closeLog(log)
    log.close
  end
  module_function :closeLog
end
 