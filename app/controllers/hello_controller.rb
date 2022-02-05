class HelloController < ApplicationController
  def hello
    @hello = RustLib.hello_world
  end
end