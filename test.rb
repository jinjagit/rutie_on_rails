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

blocked_words =[]

# Currently 618 words in pl.txt
File.readlines('config/blocked_words/pl.txt').each do |line|
  blocked_words << line.strip
end

words_to_find = get_random_items(blocked_words, 3)
text_array = create_array_of_random_strings(10)
prepared_text_array = replace_items_in_array(text_array, words_to_find)

puts words_to_find.inspect
puts prepared_text_array.inspect
