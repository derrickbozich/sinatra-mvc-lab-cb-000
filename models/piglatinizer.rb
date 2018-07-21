# class PigLatinizer
#   # attr_accessor :user_input
#   #
#   # def initialize(user_input)
#   #   @user_input = user_input
#   #   @user_input = @user_input.split(" ")
#   # end
#
#   # def piglatinize(input)
#   #   input = input.split(" ")
#   #   phrase = ""
#   #   input.each do |word|
#   #     word.to_s
#   #     case word
#   #     consonant?(word)
#   #       phrase += consonant_convert(word)
#   #     when consonant_cluster?(word)
#   #       phrase += consonant_cluster_convert(word)
#   #     when vowel?(word)
#   #       phrase += vowel_convert(word)
#   #     end
#   #   end
#   #   phrase
#   # end
#
#
#   def consonant?(input)
#       input.scan(/^[^aeiou]+/)[0].length == 1 ? true : false
#   end
#
#   def consonant_cluster?(input)
#     input.scan(/^[^aeiou]+/)[0].length >= 2 ? true : false
#   end
#
#   def vowel?(input)
#       input.scan(/^[aeiou]+/)[0] ? true : false
#   end
#
#   def consonant_convert(input)
#     first_letter = input[0]
#     input[0] = ''
#     input + first_letter + "ay"
#   end
#
#   def consonant_cluster_convert(input)
#     consonants = input.scan(/^[^aeiou]+/)
#     new_word = input.gsub(/^[^aeiou]+/, '') + consonants[0] + "ay"
#     # new_start_of_word + consonants + "ay"
#   end
#
#   def vowel_convert(input)
#     input+"way"
#   end
# end
#
# # input = "lets eat hay by the bay I just may string"
# # instance = PigLatinizer.new(input)
# # instance.piglatinize
# #
# # phrase = ''
# # case word
# # when instance.consonant?(word)
# #   phrase += instance.consonant_convert(word)
# # when instance.consonant_cluster?(word)
# #   phrase += instance.consonant_cluster_convert(word)
# # when instance.vowel?(word)
# #   phrase += instance.vowel_convert(word)
# # end


class PigLatinizer

  def piglatinize(input_str)
    x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
    puts x
    x
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end




end
