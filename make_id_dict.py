#! python3
# Gets the card data from netrunnerdb and extracts a dictionary of card name
# to card code
import requests, json

def make_id_dict(url="https://netrunnerdb.com/api/2.0/public/cards"):

    card_id_dict = {}

    r = requests.get(url=url)
    cards = r.json()["data"]
    for card in cards:
        code = card["code"]
        # remove ' to align with clj implementation
        title = card["title"].replace("'","")
        card_id_dict[title] = code
    return card_id_dict

if __name__ == "__main__":
    card_id_dict = make_id_dict()
    with open("card_id_dict.json", 'w', encoding="utf-8") as f:
        f.write(json.dumps(card_id_dict))
    
