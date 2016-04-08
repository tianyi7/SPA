# encoding:utf-8
=begin
函数名：readPlane
输入：读取文件路径
输出：平面方程数组
功能：读取平面方程保存至对象中
作者：刘洋
日期：2016.3.23
备注：无
=end
require File.join(File.expand_path(".."),'/Entity/Plane')
def readPlane(filename)
  planeArray = Array.new
  # filename = "E:/Code/SPA/doc/plane.txt"
  file = File.open(filename)
  file.each_line do |line|
    lineArray = line.split()#将每一行字符串以空格作为分隔符进行分离并保存到数组中
    for i in 0..lineArray.size
      lineArray[i] = lineArray[i].to_f
    end
    plane = Plane.new
    plane.equation = lineArray[0,4]#前四个表示为平面方程
    plane.point = [lineArray[4,3],lineArray[7,3],lineArray[10,3],lineArray[13,3]]#凸点坐标数组
    #plane.material = lineArray[16]#平面材质
    #plane.type = lineArray[17]#平面类型
    planeArray.push(plane)
  end
  file.close
  return planeArray
end

#filename = "E:/Code/SPA/doc/data.txt"
#p readPlane(filename)
