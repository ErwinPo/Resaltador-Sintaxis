x=int(input())
final= str()

for cont in range( 1, x, 1):
    final=final+str(cont)+", "
    
for cont in range( x, 1, -1):
    final=final+str(cont)+", "

print (final+"1")

    

    