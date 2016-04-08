def tempLog(data)
  file = File.new("E:\\Code\\SPA\\Log\\log.txt","a+")
  file.syswrite(data[0].to_s + ' ' + data[1].to_s + ' ' + data[2].to_s + "\n")
end
def planeLog(data)
  file = File.new("E:\\Code\\SPA\\Log\\planeNumlog.txt","a+")
  file.syswrite(data[0].to_s + "\n")
end
