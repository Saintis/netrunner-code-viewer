#! python3
# Script to generate the markdown files for the jekyll webpage

card_sets = ["agendas", "assets", "operations", "upgrades", "ice",
              "events", "programs", "icebreakers", "resources", "hardware",
              "identities"]

def make_md(card_set: str):
    " make the markdown file for specified card set "
    path = card_set + ".md"

    cap_card_set = card_set.capitalize()

    with open(path, 'w') as f:
        # print front matter
        f.write("---\n")
        f.write("layout: default\n")
        f.write("title: {}\n".format(cap_card_set))
        f.write("permalink: /{}/\n".format(card_set))
        f.write("---\n\n")

        # print header
        f.write("# {}\n\n".format(cap_card_set))

        # loop
        f.write("{% for card_data in site.data." + card_set + " %}\n\n")

        # card name
        f.write("## {{ card_data.name }}\n\n")

        # card code
        f.write("{% highlight clojure %}\n")
        f.write("{{ card_data.code }}\n")
        f.write("{% endhighlight %}\n\n")

        
        f.write("{% endfor %}\n")

if __name__ == "__main__":
    for card_set in card_sets:
        make_md(card_set)
