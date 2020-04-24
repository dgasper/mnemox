defmodule MnemoxTest do
  use ExUnit.Case
  doctest Mnemox

  describe ".to_s" do
    test "turns positive integers to mnemonic strings" do
      assert Mnemox.to_s(0) == "ba"
      assert Mnemox.to_s(1) == "bi"
      assert Mnemox.to_s(99) == "zo"
      assert Mnemox.to_s(100) == "biba"
      assert Mnemox.to_s(101) == "bibi"
      assert Mnemox.to_s(392406) == "kogochi"
      assert Mnemox.to_s(25437225) == "haleshuha"
    end

    test "turns negative integers to mnemo strings" do
      assert Mnemox.to_s(-1) == "xabi"
      assert Mnemox.to_s(-99) == "xazo"
      assert Mnemox.to_s(-100) == "xabiba"
    end
  end

  describe ".to_i" do
    test "rejects strings that are not mnemo strings" do
      assert_raise CondClauseError, fn ->
        Mnemox.to_i("blah blah blah")
      end

      assert_raise CondClauseError, fn ->
        Mnemox.to_i("xabixabi")
      end
    end

    test 'turns mnemo strings to integers' do
      assert Mnemox.to_i("yoshida") == 947110
      assert Mnemox.to_i("bajo") == 34
      assert Mnemox.to_i("xabaji") == -31
      assert Mnemox.to_i("tonukatsu") == 79523582
    end
  end
end
