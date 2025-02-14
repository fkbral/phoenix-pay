defmodule Phoenixpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv" |> File.read() |> handle_file()
  end

  def sum_from_file_without_pipe(filename) do
    file = File.read("#{filename}.csv")
    handle_file(file)
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
