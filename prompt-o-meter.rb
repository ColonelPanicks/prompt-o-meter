#!/usr/bin/env ruby

require 'YAML'

questions = YAML.load_file('questions.yaml')
@lists = YAML.load_file('lists.yaml')

@blank = "______"


def ask_question(questions)
  # Select one question from the list
  q = questions[questions.keys.sample]

  # Separate question and lists
  question = q.delete('question')
  options = q

  # Loop through options
  options.each do |option, list|
    # Select random item from list
    replace = @lists[list].sample

    # Replace instances in text
    question.gsub!("{{" + option + "}}", replace)

    # Replace blank
    question.gsub!("{{BLANK}}", @blank)
  end

  # Ask question
  puts "ASKING QUESTION"
  puts question
  puts

end

ask_question(questions)
