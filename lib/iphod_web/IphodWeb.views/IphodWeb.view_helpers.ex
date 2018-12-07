require IEx

defmodule ViewHelpers do
  use IphodWeb, :view

  def markdown(s) do
    s |> Earmark.as_html!() |> raw
  end

  def text_list_to_html(model) do
    s =
      model
      |> Enum.reduce("", fn el, acc -> acc <> el.body end)

    s
    # |> String.replace(# replace 4 more spaces with three
    |> String.replace(~r/\s{4,}/, "   ")
    |> Earmark.as_html!()
    |> raw
  end
end
