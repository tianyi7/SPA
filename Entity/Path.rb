# encoding:utf-8
=begin
类名:Path(径类）
功能：组织空间中径信息
作者：刘洋
日期：2016.3.25
备注：
=end
class Path
  attr_accessor :plane #面方程数组
  attr_accessor :point #凸点坐标数组
  attr_accessor :material #面材质
  attr_accessor :type #面类型
end
