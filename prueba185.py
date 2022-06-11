import random

n1 =random.randint(1,10)
n2 = random.randint(1,10)
print(n1,"+",n2)

respuesta=int(input())

if respuesta == n1+n2:
    print("bien")
