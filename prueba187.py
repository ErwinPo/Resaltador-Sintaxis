x = int(input())
y = int(input())
z = int(input())

x2 = int(input())
y2 = int(input())
z2 = int(input())

def horas(x):
    segh= x*3600
    return(segh)

def minutos(y):
    segm= y*60
    return(segm)

print(horas(x)+ minutos(y) + z)

print(horas(x2)+ minutos(y2) + z2)
