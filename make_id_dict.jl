#!/usr/bin/env julia
# Gets the card data from netrunnerdb and extracts a dictionary of card name
# to card code
import Requests, JSON

"Create a dictionary of card title to card id number by reading all cards on NRDB"
function make_id_dict(url="https://netrunnerdb.com/api/2.0/public/cards")
  card_id_dict = Dict()

  r = Requests.get(url)
  cards = Requests.json(r)["data"]
  for card in cards
    code = card["code"]
    # remove ' to align with clj implementation
    title = replace(card["title"], "'","")
    card_id_dict[title] = code
  end

  println("Created Dict(title => id) for $(length(cards)) cards")
  return card_id_dict
end

card_id_dict = make_id_dict()
open(f -> JSON.print(f, card_id_dict), "card_id_dict.json", "w")
