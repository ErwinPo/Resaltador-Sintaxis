import tkinter
import random

n1 = random.randint(1,10)
n2 = random.randint(1,10)
prob = [n1, n2]

ventana = tkinter.Tk()
ventana.geometry('600x400')

titulo= tkinter.Label(ventana, text = 'Calculo Mental', bg = 'yellow')

#suma
problema = tkinter.Label(ventana, text = prob[0])
mas= tkinter.Label(ventana, text = '+')
problema1 = tkinter.Label(ventana, text = prob[1])

#respuesta
respuesta = tkinter.Entry(ventana, font = 'Helvetica 15')

def respuestain():
    resp = respuesta.get()
    if resp == n1+n2:
        resultado['text'] = 'bien'
        
boton1 = tkinter.Button(ventana, text = 'Sobres', command = respuestain)

resultado = tkinter.Label(ventana)

problema.grid(row=1, column=1)
problema1.grid(row=1, column=3)
mas.grid(row=1, column=2)
respuesta.grid(row = 4, column = 5)
boton1.grid(row = 5, column = 5)
resultado.grid(row = 6, column = 6)

ventana.mainloop()