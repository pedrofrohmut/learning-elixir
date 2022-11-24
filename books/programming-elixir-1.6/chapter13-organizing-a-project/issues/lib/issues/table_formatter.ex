defmodule Issues.TableFormatter do
  def split_into_columns(rows, headers), do: (
      for header <- headers, do: (
          for row <- rows, do: (
              if(is_binary(row[header]), do: row[header], else: to_string(row[header]))
          )
      )
  )

  def widths_of(columns), do: (
      for cells <- columns, do: (
          Enum.reduce(cells, 0, fn cell, acc ->
              if(String.length(cell) > acc, do: String.length(cell), else: acc)
          end)
      )
  )

  def format_for(column_widths), do: (
      column_widths
      |> Enum.map(fn x -> "~-#{x}s" end)
      |> Enum.join(" | ")
      |> Kernel.<>("~n")
  )

  def format_and_print_table(data, headers), do: (
      data_by_columns = split_into_columns(data, headers)
      column_widths = widths_of(data_by_columns)
      format = format_for(column_widths)
      print_table(headers, data_by_columns, column_widths, format)
  )

  def print_table(headers, data_by_columns, column_widths, format), do: (
      print_table_header(headers, format)
      print_table_separator(column_widths)
      print_table_body(data_by_columns, format)
  )

  def print_table_header(fields, format), do: :io.format(format, fields)

  def print_table_separator(column_widths), do: (
      column_widths
      |> Enum.map(fn width -> List.duplicate("-", width) end)
      |> Enum.join("-+-")
      |> IO.puts
  )

  def print_table_body(data, format), do: (
      data
      |> List.zip
      |> Enum.map(fn x -> Tuple.to_list(x) end)
      |> Enum.each(fn x -> :io.format(format, x) end)
  )
end
