# Prompt-O-Meter

## Overview

A simple ruby script for generating prompts from questions which are populated with random items from lists.

## Usage

Generate a prompt with (obviously this requires Ruby installed on your system):
```
ruby prompt-o-meter.rb
```

## Questions

The file `questions.yaml` holds the questions and links between item lists and replacements. A question is structured as follows:
```
x:
  question: "My prompt needs a random person, how about {{person}}? They're {{BLANK}}"
  person: people
```
Where:
- `x` is a number or some random thing to identify it, it's just a random key to indent into to make the yaml look nice
- `question` is the prompt, specially treated strings in the question are:
    - `{{BLANK}}` - This is where to position the "blank" area to prompt for responses
    - ``{{foo}}`` - Where `foo` is any string, this is a key to look for within `x`
` `person` is a string to replace within `question`, selecting a random item from the list `people` (please don't make the string `BLANK` as a key, that'll just be silly and will mess things up) 

## Lists

The file `lists.yaml` holds the various lists of items to randomly select from when generating a prompt. A list is structured as follows:
```
people:
  - John Doe
  - Jane Doe
  - Grimace McDonald
  - My Son
```

Where `people` is the name of the list (please make it unique, it'll just break things otherwise) which contains a hyphenated list of items for the list.
