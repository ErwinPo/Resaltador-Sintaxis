x = int(input())
y = int(input())
z = int(input())

if x>=y>=z:
    print(z,y,x, sep="\n")
elif x>=z>=y:
    print(y,z,x, sep="\n")
elif y>=x>=z:
    print(z,x,y, sep="\n")
elif y>=z>=x:
    print(x,z,y, sep="\n")
elif z>=x>=y:
    print(y,x,z, sep="\n")
elif z>=y>=x:
    print(x,y,z, sep="\n")