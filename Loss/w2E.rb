include Math
#计算一次反射点的点前场强
def w2E1 (p,beginPoint,endPoint)
  r = length(beginPoint,endPoint)
  e = Math.sqrt(30*p)/r
  return e
end
#计算一次反射场强
def w2E2(e,beginPoint,refPoint,endPoint,i,plane,mode)
  n = x2n(beginPoint,refPoint,plane)
  if mode == 0 then
    length1 = length(beginPoint,refPoint)
    length2 = length(refPoint,endPoint)
    e = e*x2r(i,n)*r2A(length1,length2)
  elsif mode == 1
    e = e*x2r(i,n)*0.5
  elsif
  e = e*x2r(i,n)*1
  end
  return e
end
#计算系数R的相乘数值,i为材质系数,n为角度
def x2r(i,n)
  r1 = (i*Math.cos(n)-Math.sqrt(i-Math.sin(n)*Math.sin(n)))/(i*Math.cos(n)+Math.sqrt(i-Math.sin(n)*Math.sin(n)))
  r2 = (Math.cos(n)-Math.sqrt(i-Math.sin(n)*Math.sin(n)))/(Math.cos(n)+Math.sqrt(i-Math.sin(n)*Math.sin(n)))
  r = (r1*r2).abs
end

#计算距离
def length(beginPoint,endPoint)
  x1,y1,z1 = beginPoint
  x2,y2,z2 = endPoint
  length = Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)+(z2-z1)*(z2-z1))
  return length
end

#计算时间
def time(length)
  time = length/300000000
end

#计算角度
def x2n(beginPoint,endPoint,plane)
  x1,y1,z1 = beginPoint
  x2,y2,z2 = endPoint
  m,n,p = x2-x1,y2-y1,z2-z1
  a,b,c = plane
  n = PI/2-asin((a*m+b*n+c*p).abs/(Math.sqrt(a*a+b*b+c*c)*Math.sqrt(m*m+n*n+p*p)))
  return n
end

#计算系数A
def r2A(length1,length2)
  a = length1/(length1+length2)
  return a
end
beginPoint = [2,10,2]
endPoint = [3.5,1,1.2]
refPoint = [[2.405,0,1.784],[2.932,13,1.503],[3.459,0,1.222]]
plane = [[0,-1,0],[0,1,0],[0,-1,0]]
i = [7.5,2.1]
mode = [0,1,2]
e1 =  w2E1(20,beginPoint,refPoint[0])
p e1
e2 = w2E2(e1,beginPoint,refPoint[0],refPoint[1],i[0],plane[0],mode[1])
p e2
e3 = w2E2(e2,refPoint[0],refPoint[1],refPoint[1],i[0],plane[1],mode[2])
p e3
e4 = w2E2(e3,refPoint[1],refPoint[2],endPoint,i[0],plane[2],mode[0])
p e4
