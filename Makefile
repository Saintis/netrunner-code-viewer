# Do all stuff (except serve). Update all data and such.
all: id_dict card_data md index

# Serve the site using jekyll
serve: index
	bundle exec jekyll serve

# Generate the normal markdown pages - run when card_data has changed
md: make_md.jl
	julia make_md.jl

# Generate the index page - run when README.md changes
index: gen_index.py
	python3 gen_index.py

# Updates the card data - run when jinteki.net code is updated
card_data: update_clj.sh card_data.py
	./update_clj.sh
	python3 card_data.py

# Updates the netrunnerdb id dictionary - run when new cards are added
id_dict: make_id_dict.py
	python3 make_id_dict.py
