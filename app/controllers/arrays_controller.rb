class ArraysController < ApplicationController
  def reverse
    array = ['Ruby', 'to', 'Rust']
    reversed = RustLib.reverse(array)

    @text = "Pass array from Ruby to Rust  => #{array.inspect}\n"\
            "Return reversed array to Ruby => #{reversed.inspect}"
  end

  def blocked_words
    blocked_words =[]

    # Currently 618 words in pl.txt
    File.readlines(Rails.root.join("config/blocked_words/pl.txt")).each do |line|
      blocked_words << line.strip
    end

    words_to_find = get_random_items(blocked_words, 5)
    text_array = create_array_including_supplied_words(100000, words_to_find)
    found_words = find_blocked_words(text_array, blocked_words)
    check = check_array_contains_elements(found_words, words_to_find)

    @text = "words_to_find: #{words_to_find.inspect}\n"\
            "text_array: #{text_array.inspect}\n"\
            "found_words: #{found_words.inspect}\n"\
            "passed check? #{check}"
  end

  private

  def find_blocked_words(text_array, blocked_words)
    found_words = []

    text_array.length.times do |i|
      word = text_array[i]
      found_words << word if blocked_words.include? word
    end

    found_words
  end

  def check_array_contains_elements(array, elements)
    passed = true

    elements.length.times do |i|
      passed = false unless array.include? elements[i]
    end

    passed
  end

  # Includes zero: e.g. n_unique_integers(9, 3)
  # will return 3 unique integers, randomly chosen from the range 0..8
  def n_unique_integers (from_n, get_n)
    check_unique_selection_limit(from_n, get_n)

    integers = []
      loop do
        int = rand(from_n)
        integers << int unless integers.include? int
        break if integers.length == get_n
      end

      integers
  end

  def get_random_items(array, n_items)
    check_unique_selection_limit(array.length, n_items)

    indices = n_unique_integers(array.length, n_items)

    selected = []
    n_items.times do |i|
      selected << array[indices[i]]
    end

    selected
  end

  def check_unique_selection_limit(a, b)
    if b > a
      raise StandardError.new "Cannot return more unique items than exist"
    end
  end

  def replace_items_in_array(array, new_items)
    check_unique_selection_limit(array.length, new_items.length)

    indices = n_unique_integers(array.length, new_items.length)

    new_items.length.times do |i|
      array[indices[i]] = new_items[i]
    end

    array
  end

  def create_array_of_random_strings(n)
    array = []

    n.times do
      num = rand(10) + 1
      array << (0...num).map { ('a'..'z').to_a[rand(26)] }.join
    end

    array
  end

  def create_array_including_supplied_words(n_words, supplied_words)
    array_of_random_strings = create_array_of_random_strings(n_words)
    prepared_array = replace_items_in_array(array_of_random_strings, supplied_words)

    prepared_array
  end
end