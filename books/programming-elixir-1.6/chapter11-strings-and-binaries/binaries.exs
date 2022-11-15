defmodule Binaries do
  def main() do
    # Binaries literals is like << term, ... >>
    b = << 1, 2, 3 >> # << 1, 2, 3 >>
    byte_size(b) # 3
    bit_size(b) # 24

    # Modifiers to term size (1::size(4) == 0001 and 1::size(2) == 01)
    b2 = << 1::size(2), 1::size(3) >> # << 9::size(5) >>
    byte_size(b2) # 1
    bit_size(b2) # 5

    # Integers, floats and binaries
    int_number = << 1 >> # << 1 >>
    float_number = << 2.5::float >> # << 64, 4, 0, 0, 0, 0, 0, 0 >>
    mix = << int_number::binary, float_number::binary >> # << 1, 64, 4, 0, 0, 0, 0, 0, 0 >>
  end
end

Binaries.main()
