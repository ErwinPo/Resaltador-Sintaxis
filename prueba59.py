x = int(input())

if x==360 or x==0 or x==90 or x==180 or x==270:
    print('eje')
    
elif x>0 and x<90:
    print('cuadrante 1')

elif x>90 and x<180:
    print('cuadrante 2')

elif x>180 and x<270:
    print('cuadrante 3')

elif x>270 and x<360:
    print('cuadrante 4')
    
else:
    print('excede')