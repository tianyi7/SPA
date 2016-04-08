# encoding:utf-8
=begin
验证线面交点合法性
=end
def verifyPoint(beginPoint,endPoint,reflectPoint)
    x1,y1,z1 = beginPoint
    x2,y2,z2 = endPoint
    x3,y3,z3 = reflectPoint
    if x1==x3&&y1==y3&&z1==z3 then
        return 1
    elsif x2==x3&&y2==y3&&z2==z3 then
        return 1
    else
        return 0
    end
end
