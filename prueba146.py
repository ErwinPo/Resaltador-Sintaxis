x=int()
number=[]
while x!= -1:
    x=int(input())
    if x== -1:
        break
    number.append(x)   
print(number)
print(sum(number)/len(number))

