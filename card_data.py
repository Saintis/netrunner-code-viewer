#! python3
# Program to extract card code from the netrunner source
import csv
from typing import Tuple, List

CardData = Tuple[str, str]

clj_src_path = "clj/"
card_sets = ["agendas", "assets", "operations", "upgrades", "ice",
              "events", "programs", "icebreakers", "resources", "hardware",
              "identities"]

def print_data(data: List[CardData], card_set: str):
    path = "csv/" + card_set + ".csv"
    with open(path, "w", encoding="utf-8", newline='') as output_file:
        writer = csv.writer(output_file, quotechar='`', lineterminator='\n')
        for card_data in data:
            writer.writerow(card_data)

def find_boundaries(string: str, count: int, beg='{', end='}') \
        -> Tuple[str, int]:
    """
    Searches for 'beg' and 'end' in the string.
    beg and end defaults to {, } respectively
    Continues until EOL or brace_count is 0
    Returns:
      string to add - whole line if count > 0, otherwise up to
        and including final 'end'
      new brace count
    """

    index = 0
    for character in string:
        # keep index behind checked char
        index += 1
        if character == beg:
            count += 1
        elif character == end:
            count -= 1
            if count == 0:
                return (string[:index], 0)
            elif count < 0:
                loc = index - 1
                e = "Found {} when looking for {} at {}".format(beg, end, loc)
                raise ValueError(e)

    # reached end of string
    return (string, count)

def extract_data(card_set: str) -> List[CardData]:
    " Extracts the card and code pairs found for the specified card set "

    print("Extracting", card_set)
    file_path = clj_src_path + "cards-" + card_set + ".clj"
    def_string = "(def cards-" + card_set

    data = []
    
    with open(file_path, encoding="utf-8") as input_file:

        # look for the def that signifies the start of the card-code map
        while not next(input_file).startswith(def_string):
            pass

        card_name = None
        # two spaces to make alignment work
        card_code = ""

        # Either 'name', 'start' or 'code'
        looking_for = 'name'
        count = 0
        beg = '{'
        end = '}'
        line_count = 0

        # loop through remaining lines
        for row in input_file:
            
            #looking for name - search for ""
            if looking_for == 'name':
                try:
                    beg = row.index('"') + 1
                    end = row.index('"', beg)
                    card_name = row[beg:end]
                    looking_for = 'start'
                except ValueError:
                    # no string found, continue to next line
                    pass
                continue

            if looking_for == 'start':
                # check if code block starts
                try:
                    first_char = row.lstrip()[0]
                    if first_char == '{':
                        beg = '{'
                        end = '}'
                        looking_for = 'code'
                    elif first_char == '(':
                        beg = '('
                        end = ')'
                        looking_for = 'code'
                except IndexError:
                    # out of bounds, no chars on this row
                    pass

            if looking_for == 'code':
                (found_code, count) = find_boundaries(row, count, beg, end)

                
                if found_code:
                    # skip first three spaces of padding
                    card_code += found_code[3:]
                    line_count += 1
                    if count == 0:
                        # found end of code - find next card
                        looking_for = 'name'
                        msg = "  {} in {}{} ({} lines)".format(
                            card_name, beg, end, line_count
                            )
                        print(msg)
                        data.append((card_name, card_code))
                        card_name = None
                        card_code = ""
                        line_count = 1
                    
                        

    # print found stuff
    print_data(data, card_set)

if __name__ == "__main__":
    for card_set in card_sets:
        extract_data(card_set)
