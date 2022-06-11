#Erwin Porras Guerra A01734881
#Miguel jajajaja
silla= str(input())
cliente= str(input())
numsillas = int(input())


def desc(precio):
    if precio>=10000 and precio<20000 :
        preciot= precio*.90
    elif precio>=20000:
        preciot= precio*.85
    else:
        preciot = precio
    return(preciot)

def cdesc(precio):
    if precio>=10000 and precio<20000 :
        preciod= precio*.10
    elif precio>=20000:
        preciod= precio*.15
    else:
        preciod = 0
    return(preciod)

if silla == 'básica':
    precio =  700 * numsillas
    num = 700
elif silla == 'estándar':
    precio = 900 * numsillas
    num= 900
elif silla == 'lujo':
    precio = 1500 * numsillas
    num=1500

if cliente == 'frecuente':
    print(precio)
    print(precio*.20)
    print(precio*.80)
else:
    print(precio)
    print(cdesc(precio))
    print(desc(precio))
    