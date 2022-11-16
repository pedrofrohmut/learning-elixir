defmodule FileOpener do
  def main() do
    case File.open("case.exs") do
      { :ok, file } -> IO.puts "First Line: #{IO.read(file, :line)}"
      { :error, message } -> IO.puts "Failed to open file: #{message}"
    end
  end
end

FileOpener.main()
