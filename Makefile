# Do all stuff (except serve). Update all data and such.
all: id_dict card_data md index

# Serve the site using jekyll
serve: index
	bundle exec jekyll serve

# Generate the normal markdown pages - run when card_data has changed
md:
	julia make_md.jl

# Generate the index page - run when README.md changes
index:
	julia gen_index.jl

# Updates the card data - run when jinteki.net code is updated
card_data:
	sh update_clj.sh
	julia card_data.jl

# Updates the netrunnerdb id dictionary - run when new cards are added
id_dict:
	julia make_id_dict.jl
