require IEx
require Logger

defmodule EsvText do
  import RequestParser, only: [esv_query: 1]
  @esvKey 'cc9dab66c65944cabba86082bdceb26068202086'

  @moduledoc """
  Using httpc (an erlang call) because it's built in and the needs are simple
  :httpc.request needs charlists - NOT STRINGS
  pay attention to single/dbl quotes
  it works like this...

  {:ok, jn}=:httpc.request(:get, {'https://api.esv.org/v3/passage/text/?q=John+11:35-7', [{'Authorization', 'Token ' ++ @esvKey}]}, [], [])
  {resp-3tuple, list-of-header-stuff-tuples, query-resp-json}
  query_map = query-resp-json |> Poison.decode!
  vss = query_map["passages"]
  s = vss |> Enum.join( " " )

  """

  # 'Authorization': 'Token %s' % API_KEY

  def request(vss, fnotes \\ [include_footnotes: "true"]) do
    resp =
      :httpc.request(
        :get,
        {esv_url(vss), [{'Authorization', 'Token ' ++ @esvKey}]},
        [],
        []
      )

    case resp do
      {:ok, {{_, _, 'OK'}, _, jsonresp}} ->
        passages = jsonresp |> Poison.decode!() |> Map.get("passages")

        if passages |> length == 0 do
          LocalText.request("web", vss)
        else
          passages |> Enum.join("/n/n")
        end

      {:ok, {{_, returnCode, what}, _, jsonresp}} ->
        why =
          jsonresp
          |> Poison.decode!()
          |> Map.get("detail")

        [what, why] |> Enum.join(": ")

      {:error, _reason} ->
        "ESV text Failed badly"

      true ->
        "ESV Unexpected Error"
    end
  end

  def request_raw(keywords) do
    resp =
      :httpc.request(
        :get,
        {esv_url_raw(keywords), [{'Authorization', 'Token ' ++ @esvKey}]},
        [],
        []
      )

    case resp do
      {:ok, {{_, _, 'OK'}, _, jsonresp}} ->
        passages = jsonresp |> Poison.decode!() |> Map.get("passages")

        if passages |> length == 0 do
          LocalText.request("web", keywords)
        else
          passages |> Enum.join("/n/n")
        end

      # if Regex.match?(~r/^ERROR/, resp.body) do
      #   LocalText.request("web", vss)
      # else
      #   resp.body
      # end
      {:ok, {{_, returnCode, what}, _, jsonresp}} ->
        why =
          jsonresp
          |> Poison.decode!()
          |> Map.get("detail")

        [what, why] |> Enum.join(": ")

      {:error, _reason} ->
        "ESV text Failed badly"

      true ->
        "ESV Unexpected Error"
    end
  end

  def esv_url_raw(keywords) do
    IO.puts("ESV URL RAW: #{inspect(keywords)}")

    #    query =
    #      keywords
    #      |> Keyword.keys()
    #      |> Enum.reduce(%{}, fn k, acc ->
    #        # atoms can't have "-" and ESV API uses them
    #        # so change atoms with "_" to strings with "-"
    #        key = k |> Atom.to_string() |> String.replace("_", "-")
    #        acc |> Map.put(key, keywords[k])
    #      end)
    #      |> URI.encode_query()

    URI.encode("https://api.esv.org/v3/passage/html/?q=#{keywords}") |> String.to_charlist()
    # # http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Gen+1&include-headings=false
    # # footnotes = if fnotes == "fnotes", do: "true", else: "false"
    # query =
    #   keywords
    #   |> Keyword.keys()
    #   |> Enum.reduce(%{}, fn k, acc ->
    #     # atoms can't have "-" and ESV APIuses them
    #     # so change atoms with "_" to strings with "-"
    #     key = k |> Atom.to_string() |> String.replace("_", "-")
    #     acc |> Map.put(key, keywords[k])
    #   end)
    #   |> URI.encode_query()
    # 
    #     # # URI.encode("www.esvapi.org/v2/rest/passageQuery?#{query}")     
    # URI.encode("api.esv.org/v3/passage/text/?q=#{query}")
  end

  def esv_url(vss, fnotes \\ "fnotes") do
    # http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Gen+1&include-headings=false
    footnotes = if fnotes == "fnotes", do: "true", else: "false"

    query =
      %{
        "q" => esv_query(vss),
        "include-headings" => "false",
        "include-footnotes" => footnotes
      }
      |> URI.encode_query()

    # URI.encode("www.esvapi.org/v2/rest/passageQuery?#{query}")     
    URI.encode("https://api.esv.org/v3/passage/html/?#{query}") |> String.to_charlist()
  end
end
