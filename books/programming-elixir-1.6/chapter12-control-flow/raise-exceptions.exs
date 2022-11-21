defmodule RaiseExceptions do
  def file_open_no_exception(file_name) do
    case File.open(file_name) do
      { :ok, file } ->
        process(file)
      { :error, message } ->
        IO.puts :stderr, "Couldn't open #{file_name}: #{message}"
    end
  end

  def file_open_with_exception(file_name) do
    { :ok, file } ->
      process(file)
    { :error, message } ->
      raise "Failed to open config file: #{message}"

  end

  def normal_exception() do
    raise("Giving up")
  end

  def typed_exception() do
    # Exceptions with type
    raise(RuntimeError, message: "Override message")
  end
end
