#!/usr/bin/env julia

import JSON

"Escapes the string to adhere to csv format"
function escape_str(str::String)
  # check if line contains chars that require quoting - else return normal string
  if !(in(',', str) || in('\n', str) || in('"', str))
    return str
  end

  str = replace(str, "\"", "\"\"")
  return "\"$str\""
end

"Print the list of card data to a csv file. Also adds the code"
function print_data(data::Vector{Tuple{String, String}}, card_set::String)
  card_id_dict = open(f -> JSON.parse(readstring(f)), "card_id_dict.json")

  csv_data::Vector{Tuple{String, String, String}} =
  map(data) do data_tuple
    name, card_code = data_tuple
    nrdb_id = card_id_dict[name]
    (nrdb_id, name, card_code)
  end

  open("_data/$card_set.csv", "w") do f
    write(f, "id,name,code\n")

    for row in csv_data
      nrdb_id, name, code = row
      write(f, "$nrdb_id,$(escape_str(name)),$(escape_str(code))\n")
    end
  end

  #insert!(csv_data, 1, ("id", "name", "code"))

  #open(f -> writecsv(f, csv_data), "_data/$card_set.csv", "w")
end

"""
Searches for 'opn' and 'cls' in the string.
opn and cls defaults to {, } respectively
Continues until EOL or brace_count is 0
Returns:
  string to add - whole line if count > 0, otherwise up to
    and including final 'end'
  new brace count
"""
function find_boundaries(string::String, count::Int64, opn='{', cls='}')
  index = 0
  for character in string
    # keep index behind checked char
    index += 1
    if character == opn
      count += 1
    elseif character == cls
      count -= 1
      if count == 0
        return (string[1:index], 0)
      elseif count < 0
        error("Found $opn when looking for $cls at $(index - 1)")
      end
    end
  end

  # reached end of string
  string, count
end

" Extracts the card and code pairs found for the specified card set "
function extract_data(card_set::String, clj_dir="clj/src/")
  print("Extracting $card_set ")
  file_path = "$(clj_dir)/cards/$card_set.clj"
  def_string = "(def cards-$card_set"

  # Create array to lock down type
  data = Tuple{String, String}[]

  open(file_path) do input_file
    # look for the def that signifies the start of the card-code map
    while !startswith(readline(input_file), def_string) end

    card_name = ""
    # two spaces to make alignment work
    card_code = ""

    # Either 'name', 'start' or 'code'
    looking_for = :name
    count = 0
    opn = '{'
    cls = '}'
    line_count = 0

    # loop through remaining lines
    for row in eachline(input_file)
      #looking for name - search for ""
      if looking_for == :name
        opn = search(row, '"') + 1

        if opn == 1
          # did not find start of name
          continue
        end

        # avoids hitting any " in card name
        cls = searchindex(row, "\"\n", opn) - 1
        card_name = replace(row[opn:cls], "\\\"", "\"")
        looking_for = :start

        # move to next line
        continue
      end

      if looking_for == :start
        # check if code block starts
        try
          first_char = lstrip(row)[1]
          if first_char == '{'
            opn = '{'
            cls = '}'
            looking_for = :code
          elseif first_char == '('
            opn = '('
            cls = ')'
            looking_for = :code
          end
        end
      end

      if looking_for != :code
        continue
      end

      (found_code, count) = find_boundaries(row, count, opn, cls)

      # skip first three spaces of padding
      card_code = card_code * found_code[4:end]
      line_count += 1

      if count != 0
        continue
      end

      # found end of code - find next card
      looking_for = :name
      # Uncomment to add more detailed info statements
      # println("  $card_name in $opn$cls ($line_count lines)")
      push!(data, (card_name, card_code))
      card_name = ""
      card_code = ""
      line_count = 1
    end
  end

  # print found stuff
  println("- found $(length(data)) cards")
  print_data(data, card_set)
end

card_sets = ["agendas", "assets", "operations", "upgrades", "ice",
             "events", "programs", "icebreakers", "resources", "hardware",
             "identities"]

map(extract_data, card_sets)
