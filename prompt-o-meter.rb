#!/usr/bin/env ruby

# Load YAML support
require 'YAML'

# Load the YAML from questions.yaml in as a hash
questions = YAML.load_file('questions.yaml')

# Load the YAML from lists.yaml  in as a hash that's globally accessible
@lists = YAML.load_file('lists.yaml')

# Define what the {{BLANK}} text should be replaced with, globally accessible
@blank = "______"

# Create a function called ask_questions that takes one argument ("questions") that will be used when the function is run
def ask_question(questions)
  # Select one question from the list by selecting a random key (sample) from the question hash 
  q = questions[questions.keys.sample]

  # Separate question and lists
  question = q.delete('question') # This pops out the contents of the question key and captures it in a variable called question
  options = q # The rest of the data left in q is what we'll look for to replace

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
  puts question

end

# Run the function, passing through the questions we loaded in at the beginning
ask_question(questions)
