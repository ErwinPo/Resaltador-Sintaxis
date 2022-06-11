import sys
x = int(input())
y = int(input())

if x < 0 or x == 0:
    print('Error')
    sys.exit()
elif y < 0 or y == 0:
    print('Error')
    sys.exit()
print('-----')
list1 = []
for cont in range (0,x):
    elements1=str(input())
    list1.append(elements1)
print('-----')
list2=[]
for cont in range (0,y):
    elements2=str(input())
    list2.append(elements2)
print('-----')

if len(list1) > len(list2):
    shorter = len(list2)
    longlist = list1
else:
    shorter = len(list1)
    longlist = list2
list3 = []

for cont in range (0,shorter):
    list3.append(list1[cont])
    list3.append(list2[cont])
for cont in range (0, len(longlist)-shorter):
    list3.append(longlist[shorter+cont])
print(list1)
print(list2)
print(list3)