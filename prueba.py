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