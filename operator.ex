number = (1..20)
lista = Enum.map(number, fn x -> "prueba" <> Integer.to_string(x) <> ".py" end)
IO.inspect(lista)
Benchee.run(
  %{
    "concurrente" => fn -> Resaltador.concurrente(lista) end,
    "secuencial" => fn -> Resaltador.secuencial(lista) end
  }
)
