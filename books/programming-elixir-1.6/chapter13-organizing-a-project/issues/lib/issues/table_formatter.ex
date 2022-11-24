defmodule Issues.TableFormatter do
  def split_into_columns(rows, headers) do
      for header <- headers, do: (
          for row <- rows, do: (
              if(is_binary(row[header]), do: row[header], else: to_string(row[header]))
          )
      )
  end

  def widths_of(columns) do
      for cells <- columns, do: (
          Enum.reduce(cells, 0, fn cell, acc ->
              if(String.length(cell) > acc, do: String.length(cell), else: acc)
          end)
      )
  end
end
