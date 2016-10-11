#!/usr/bin/env julia

"Generates the index.md file from the README.md file"
function gen_index()
  whole_file = open(readstring, "README.md")

  header = """
  ---
  layout: default
  ---

  """

  open(f -> write(f, header * whole_file), "index.md", "w")
end

gen_index()
println("Generated index.md from README.md")
