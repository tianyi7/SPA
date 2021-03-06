# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Loss_Reflect.rb
功能:折射损耗计算
输入:入射信号材质介电系数、入射信号材质磁导率、入射信号材质电导率、信号频率、入射角、入射信号功率、发生折射材质介电系数、发生折射材质磁导率、发生折射材质电导率、折射角、障碍物厚度
输出:折射后信号功率
作者:田易
日期:16/6/16
时间:下午3:51
备注:测试函数
=end
include Math
require "complex"
require "cmath"
require File.join(File.expand_path(".."), '/Data/Data_List')
module Loss_Reflect
  def reflect(signalValue,frequency,anglein,plane)
    planeArg = Data_List.planeArgById(plane.id)
    conductivityin = planeArg[0]
    conductivityre = planeArg[1]
    permeabilityin = planeArg[2]
    permeabilityre = planeArg[3]
    permittivityin = planeArg[4]
    permittivityre = planeArg[5]
    #求复介电系数
    m=Complex(permittivityin,(-conductivityin*1.0/(2*PI*frequency)))
    s=Complex(permittivityre,(-conductivityre*1.0/(2*PI*frequency)))
    #求媒质1的波阻抗
    s1=CMath.sqrt(permeabilityin*1.0/m).real
    s2=CMath.sqrt(permeabilityin*1.0/m).imaginary
    s3=Complex(s1,s2)
    #求媒质2的波阻抗
    u1=CMath.sqrt(permeabilityre*1.0/s).real
    u2=CMath.sqrt(permeabilityre*1.0/s).imaginary
    u3=Complex(u1,u2)
    #求折射角
    r1=Math.sqrt(permittivityin*1.0/permittivityre)*Math.sin(anglein)
    r2=Math.asin(r1)
    #求反射系数
    j1=((u3*Math.cos(anglein)-s3*Math.cos(r2))*1.0/(u3*Math.cos(anglein)+s3*Math.cos(r2))).real
    j2=((u3*Math.cos(anglein)-s3*Math.cos(r2))*1.0/(u3*Math.cos(anglein)+s3*Math.cos(r2))).imaginary
    j3=j1*j1+j2*j2
    #反射功率
    signalValue=signalValue*j3
    return  signalValue
  end
  module_function :reflect
end
