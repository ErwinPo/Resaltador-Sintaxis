defmodule Resaltador do

  def getTokens(charlist) do
    :lexer.string(charlist)
  end


  def edit(:id, tchars), do: "<a style='color:#FF0000;'>#{tchars}</a>"
  def edit(:op, tchars), do: "<a style='color:#800080;'>#{tchars}</a>"
  def edit(:int, tchars), do: "<a style='color:#00FF00;'>#{tchars}</a>"
  def edit(:comment, tchars), do: "<a style='color:#ff8c00;'>#{tchars}</a>"
  def edit(:float, tchars), do: "<a style='color:#FF00FF;'>#{tchars}</a>"
  def edit(:keywords, tchars), do: "<a style='color:#dc143c;'>#{tchars}</a>"
  def edit(:delimiters, tchars), do: "<a style='color:#daa520;'>#{tchars}</a>"
  #def edit(:int, tchars), do: "<a style='color:#00FF00;'>#{tchars}</a>"


  def format(tokens) do
    #result = getTokens()
    #tokens = elem(result,1)

    Enum.map(tokens, fn {token, tchars} ->
      case token do
        :id -> "<span class=\"identifier\">#{tchars}</span>"
        :op -> "<span class=\"operator\">#{tchars}</span>"
        :int -> "<span class=\"integer\">#{tchars}</span>"
        :comment -> "<span class=\"comment\">#{tchars}</span>"
        :float -> "<span class=\"float\">#{tchars}</span>"
        :keywords -> "<span class=\"keywords\">#{tchars}</span>"
        :delimiters ->  "<span class=\"delimiters\">#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
  end

  def read(file) do
    File.read!(file)
    |> to_charlist()
    |> :lexer.string
    |> format()
    |> Enum.join("\n")
    #|> write()
  end

  # def write(data) do
  #  IO.puts
  #
  #  end
end
