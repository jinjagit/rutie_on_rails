class TestsController < ApplicationController
  def index
    array = ['Ruby', 'to', 'Rust']
    reversed = RustLib.reverse(array)

    @text = "Pass array to Rust => #{array.inspect}\nReturn reversed array to Ruby => #{reversed.inspect}"
  end
end