p "alias x='ruby 20190531_Friday/20190531.rb'" 

# Ruby str[start, length], str[regexp, capture];
# https://ruby-doc.org/core-2.4.0/String.html#method-i-5B-5D

 p '12345abc'[5,1]
 p '12345abc'[5,2]
 p '12345abc'[5,3]
 p '12345ab'[/a|b/,0]
 p '12345ab'[/a|b/,1]
 p '12345ab'[/a|b/,2]
 p '12345ab'[/5([ab])/,0]
 p '12345ab'[/5([ab])/,1]
 p '12345ab'[/5([ab])/,2]