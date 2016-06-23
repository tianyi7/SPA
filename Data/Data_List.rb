# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Data_List.rb
功能:查找各种属性的值
输入:
输出:
作者:刘洋
日期:16/6/17
时间:下午2:32
备注:
=end
module Data_List

  #获取平面参数数组方法
  def planeArgById(planeId)
    #材质介电系数
    #材质磁导率
    #材质电导率
    #平面参数库数组
    planeArgArray = [[0.0,0.067,0.000001256,0.000001256,0.00000000000885,0.0000000000531]
    ]
    #平面参数散列
    planeArgHash = {1001=>planeArgArray[0]}
     return planeArgArray[0]
  end
  module_function :planeArgById

  #网元的

end
