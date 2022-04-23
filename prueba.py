#Programa para calcular el IMC
peso=float(input("Dame el peso en kgs"))
estatura=float(input("Dame la estatura en mts"))
if estatura > 0:
    IMC=peso/(estatura**2)
    print("Tu IMC es de ",IMC)
    if IMC <20:
        print("Estas delgado")
    else:
        if IMC >=20 and IMC < 25:
            print("Estas en tu peso normal")
        else:
            if IMC >=25 and IMC<27:
                print("Estas en sobrepeso")
            else:
                print("Estas en obesidad")
else:
    print("Error no puedo calcular tu IMC")

    3.23456j
    "2435"
    #gfhth
    3_245.45e-3245_23j
    .34e-1j
    134e-34j
