#! python3
# Generate the index.md file from the README.md file (just add jekyll header)

def gen_index(file: str = "README.md"):
    whole_file = None
    with open(file) as f:
        whole_file = f.read()

    with open("index.md", 'w') as f:
        f.write("---\n")
        f.write("layout: default\n")
        f.write("---\n\n")
        f.write(whole_file)

if __name__ == "__main__":
    gen_index()
            
        
