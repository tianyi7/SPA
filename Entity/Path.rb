# encoding:utf-8
=begin
类名:Path(径类）
功能：组织空间中径信息
作者：刘洋
日期：2016.3.25
备注：
=end
class Path
  attr_accessor :neId #网元ID
  attr_accessor :ueId #终端ID
  attr_accessor :loss #损耗
  attr_accessor :delay #时延
  attr_accessor :pointArray#几何路径坐标
end
