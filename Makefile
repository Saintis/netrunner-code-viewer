all: make_md index

serve: make_md index
	bundle exec jekyll serve
 
make_md: card_data make_md.py
	python3 make_md.py

index: gen_index.py
	python3 gen_index.py

card_data: card_data.py
	python3 card_data.py
  
