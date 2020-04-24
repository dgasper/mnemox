# Mnemox

This library provides methods for turning integers into easier to remember 'words' and vice-versa.
A port of [munemo](https://github.com/jmettraux/munemo) to Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mnemox` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mnemox, "~> 0.1.0"}
  ]
end
```

## usage

```elixir
iex> Mnemox.to_s(947110)
"yoshida"

iex> Mnemox.to_i("yoshida")
947110
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mnemox](https://hexdocs.pm/mnemox).

