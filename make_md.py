#! python3
# Script to generate the markdown files for the jekyll webpage

def make_md(card_set: str):
    " make the markdown file for specified card set "
    path = "cards/" + card_set + ".md"

    cap_card_set = card_set.capitalize()

    with open(path, 'w') as f:
        # print front matter
        f.write("---\n")
        f.write("layout: default\n")
        f.write("title: {}\n".format(cap_card_set))
        f.write("permalink: /cards/{}/\n".format(card_set))
        f.write("---\n\n")

        # print header
        f.write("# {}\n\n".format(cap_card_set))

        # loop
        f.write("{% for card_data in site.data." + card_set + " %}\n\n")

        # card name
        f.write("## {{ card_data.name }}\n\n")

        # netrunnerdb link
        f.write("[Card #{{card_data.id}}]")
        f.write("(https://netrunnerdb.com/en/card/{{ card_data.id }})\n\n")

        # card code
        f.write("{% highlight clojure %}\n")
        f.write("{{ card_data.code }}\n")
        f.write("{% endhighlight %}\n\n")


        f.write("{% endfor %}\n")

if __name__ == "__main__":
    card_sets = ["agendas", "assets", "operations", "upgrades", "ice",
                 "events", "programs", "icebreakers", "resources", "hardware",
                 "identities"]

    for card_set in card_sets:
        make_md(card_set)
