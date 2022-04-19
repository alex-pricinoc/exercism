defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number), do: factors_for(number, 2, [])

  defp factors_for(number, prime, primes) when number < prime * prime,
    do: Enum.reverse([number | primes])

  defp factors_for(number, prime, primes) when rem(number, prime) == 0,
    do: factors_for(div(number, prime), prime, [prime | primes])

  defp factors_for(number, lower_bound, primes), do: factors_for(number, lower_bound + 1, primes)
end
