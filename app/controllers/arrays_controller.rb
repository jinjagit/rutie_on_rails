class ArraysController < ApplicationController
  def reverse
    array = ['Ruby', 'to', 'Rust']
    reversed = RustLib.reverse(array)

    @text = "Pass array from Ruby to Rust  => #{array.inspect}\n"\
            "Return reversed array to Ruby => #{reversed.inspect}"
  end
end