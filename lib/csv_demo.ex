defmodule CsvDemo do
  @moduledoc """
  Documentation for CsvDemo.
  """

  alias NimbleCSV.RFC4180, as: CSV

  def read_and_output do
    # streams are cool and all but only really needed when you're dealing
    # with files whom are hundreds of thousands (or millions) of lines long
    # the benefit of a stream is that it only opens a chunk of the file at a time
    # in effort to not overwhelm the system's available memory.
    # For the moment, for your purpose, "reading" the file is probably fine.
    # ANYWAY, I am pretty sure you intend for users to upload or paste the contents of a file
    # which means that streaming is pointless regardless.

    # The first two lines here could easily be a string like
    # "some,csv,data"
    # |> CSV.parse_string
    # I am just getting a string from a file
    "matt.csv"
    |> File.read!
    |> CSV.parse_string
    |> Enum.map(fn [id, name, age] = row ->
      # note that the first line's values are headers and ignored
      IO.inspect row
      %{id: id, name: name, age: age}
    end)

  end
end
