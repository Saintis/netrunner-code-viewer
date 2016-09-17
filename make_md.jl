#!/usr/bin/env julia

"make the markdown file for specified card set"
function make_md(card_set)
  path = "cards/$card_set.md"
  nrdb_link = "https://netrunnerdb.com/en/card/"

  cap_card_set = ucfirst(card_set)

  markdown_str = """
  ---
  layout: default
  title: $cap_card_set
  permalink: /cards/$card_set/
  ---

  # $cap_card_set

  {% for card_data in site.data.$card_set %}

  ## {{ card_data.name }}

  [Card #{{ card_data.id }}]($nrdb_link{{ card_data.id }})

  {% highlight clojure %}
  {{ card_data.code }}
  {% endhighlight %}

  {% endfor %}
  """

  open(path, "w") do f
    write(f, markdown_str)
  end
end

# Make markdown files for each card set
card_sets = ["agendas", "assets", "operations", "upgrades", "ice",
             "events", "programs", "icebreakers", "resources", "hardware",
             "identities"]

for card_set in card_sets
  make_md(card_set)
end

println("Produced Markdown for $(length(card_sets)) card sets")
