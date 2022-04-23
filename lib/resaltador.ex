defmodule Resaltador do

  def getTokens(fname) do
    File.read!(fname)
    |> to_charlist
    |>:lexer.string()
  end

  def main(args\\[]) do
    args
    |> getTokens()
    |> format()
    |> IO.puts()
  end


  def edit(:id, tchars), do: "<a style='color:#FF0000;'>#{tchars}</a>"
  def edit(:op, tchars), do: "<a style='color:#800080;'>#{tchars}</a>"
  def edit(:int, tchars), do: "<a style='color:#00FF00;'>#{tchars}</a>"
  def edit(:comment, tchars), do: "<a style='color:#ff8c00;'>#{tchars}</a>"
  def edit(:float, tchars), do: "<a style='color:#FF00FF;'>#{tchars}</a>"
  def edit(:keywords, tchars), do: "<a style='color:#dc143c;'>#{tchars}</a>"
  def edit(:delimiters, tchars), do: "<a style='color:#daa520;'>#{tchars}</a>"
  #def edit(:int, tchars), do: "<a style='color:#00FF00;'>#{tchars}</a>"


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
