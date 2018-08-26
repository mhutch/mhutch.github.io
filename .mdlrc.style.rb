all
rule 'header-style', :style => :atx
rule 'line-length', :line_length => 180, :code_blocks => false, :tables => false
rule 'first-header-h1', :level => 2
#rule 'first-line-h1', :level => 2

exclude_rule "first-line-h1"
