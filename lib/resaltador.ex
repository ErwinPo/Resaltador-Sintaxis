defmodule Resaltador do

  def concurrente(lista) do
    Task.async_stream(lista, fn x -> main(x) end)
    IO.inspect(self())
  end

  def secuencial([head|tail]) do
    main(head)
    secuencial(tail)
  end
  def secuencial([]), do: nil

  def getTokens(fname) do
    File.read!(fname) |> to_charlist |> :lexer.string()
  end

  def main(args\\[]) do
    args
    |> getTokens() |> format() |> IO.puts()
  end

  def format(token) do
    tokens = elem(token,1)
    html = Enum.map(tokens, fn {token, _,tchars} ->
      tchars = HtmlEntities.encode(to_string(tchars))
      case token do
        :id -> "<span class=\"id\">#{tchars}</span>"
        :imagnumber -> "<span class=\"imagnumber\">#{tchars}</span>"
        :op -> "<span class=\"operator\">#{tchars}</span>"
        :int -> "<span class=\"int\">#{tchars}</span>"
        :comment -> "<span class=\"comment\">#{tchars}</span>"
        :float -> "<span class=\"float\">#{tchars}</span>"
        :keywords -> "<span class=\"keywords\">#{tchars}</span>"
        :delimiters ->  "<span class=\"delimiter\">#{tchars}</span>"
        :string -> "<span class=\"string\">#{tchars}</span>"
        :newline -> "<span class=\"newline\">#{tchars}</span>"
        :space -> "<span class=\"space\">#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
    html = Enum.join(html)
    "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><link rel=\"stylesheet\" href=\"colorscript.css\"></head><body><pre>#{html}</pre></body></html>"
  end
end
