class PigLatinizer


  def piglatinize(input)
    binding.pry
    x = (input.split(" ").length == 1) ? piglatinize_word(input) : piglatinize_sentence(input)

    puts x
    x
  end

  def piglatinize_word(input)
    if consonant?(input)
      consonant_convert(input)
    elsif consonant_cluster?(input)
      consonant_cluster_convert(input)
    else
      input+"way"
    end
  end

  def piglatinize_sentence(input)
    input.split(" ").collect{ |word| piglatinize_word(word) }.join(" ")
  end


  def consonant?(input)
      input.scan(/^[^aeiou]+/)[0].length == 1 ? true : false
  end

  def consonant_cluster?(input)
    input.scan(/^[^aeiou]+/)[0].length >= 2 ? true : false
  end

  # def vowel?(input)
  #     input.scan(/^[aeiou]+/)[0] ? true : false
  # end

  def consonant_convert(input)
    first_letter = input[0]
    input[0] = ''
    input + first_letter + "ay"
  end

  def consonant_cluster_convert(input)
    consonants = input.scan(/^[^aeiou]+/)
    new_word = input.gsub(/^[^aeiou]+/, '') + consonants[0] + "ay"
    # new_start_of_word + consonants + "ay"
  end

  # def vowel_convert(input)
  #   input+"way"
  # end
end




# class PigLatinizer
#
#   def piglatinize(input_str)
#     x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
#     puts x
#     x
#   end
#
#   private
#
#   def consonant?(char)
#     !char.match(/[aAeEiIoOuU]/)
#   end
#
#   def piglatinize_word(word)
#     # word starts with vowel
#     if !consonant?(word[0])
#       word = word + "w"
#     # word starts with 3 consonants
#     elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
#       word = word.slice(3..-1) + word.slice(0,3)
#     # word starts with 2 consonants
#     elsif consonant?(word[0]) && consonant?(word[1])
#       word = word.slice(2..-1) + word.slice(0,2)
#     # word starts with 1 consonant
#     else
#       word = word.slice(1..-1) + word.slice(0)
#     end
#     word << "ay"
#   end
#
#   def piglatinize_sentence(sentence)
#     sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
#   end
#
#
#
#
# end
