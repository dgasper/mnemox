defmodule Mnemox do
  @moduledoc """
  Documentation for Mnemox.
  """

  @syllables ~w[
    ba  bi  bu  be  bo
    cha chi chu che cho
    da  di  du  de  do
    fa  fi  fu  fe  fo
    ga  gi  gu  ge  go
    ha  hi  hu  he  ho
    ja  ji  ju  je  jo
    ka  ki  ku  ke  ko
    la  li  lu  le  lo
    ma  mi  mu  me  mo
    na  ni  nu  ne  no
    pa  pi  pu  pe  po
    ra  ri  ru  re  ro
    sa  si  su  se  so
    sha shi shu she sho
    ta  ti  tu  te  to
    tsa tsi tsu tse tso
    wa  wi  wu  we  wo
    ya  yi  yu  ye  yo
    za  zi  zu  ze  zo
  ]

  @indexed_syllables @syllables |> Enum.with_index(0) |>Enum.map(fn {k,v}->{v,k} end) |> Map.new

  @mapped_indices @syllables |> Enum.with_index(0) |> Map.new

  @syllable_count @syllables |> Enum.count

  @neg "xa"

  @doc """
  Convert an integer into an easy to remember string.

  ## Examples

      iex> Mnemox.to_s(947110)
      "yoshida"

  """
  def to_s(i) when i == 0 do
    @indexed_syllables[0]
  end

  def to_s(i) do
    maybe_neg(i) <> tos(abs(i))
  end

  @doc """
  Convert a mnemonic string into an integer.

  ## Examples

      iex> Mnemox.to_i("yoshida")
      947110

  """
  def to_i(s) do
    case get_prefix(s, 2) do
      [@neg, tail] ->
        -toi(tail, 0)
      _ ->
        toi(s, 0)
    end

  end

  defp tos(i) when i <= 0 do
    ""
  end

  defp tos(i) do
    mod = rem(i, @syllable_count)
    rst = div(i, @syllable_count)

    tos(rst) <> @indexed_syllables[mod]
  end

  defp maybe_neg(i) when i < 0 do
    @neg
  end

  defp maybe_neg(_i) do
    ""
  end

  defp toi("", acc) do
    acc
  end

  defp toi(s, acc) do
    [syllable, tail] = next_syllable(s)
    toi(tail, @syllable_count * acc + @mapped_indices[syllable])
  end

  defp next_syllable(s) do
    cond do
      ([head, tail] = get_prefix(s, 2)) && (@mapped_indices[head] != nil) -> [head, tail]
      ([head, tail] = get_prefix(s, 3)) && (@mapped_indices[head] != nil)  -> [head, tail]
    end
  end

  defp get_prefix(s, len) do
    <<head :: binary-size(len)>> <> rest = s
    [head, rest]
  end
end
