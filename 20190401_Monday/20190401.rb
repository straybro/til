p "alias x='ruby 20190401_Monday/20190401.rb'"
# in bounds
def ib(i,last_i)
    0 <= i && i <= last_i
end
def crosswordFormation(words)
    # Convert words in arrays
    w = words.map(&:chars)
    total = 0
    f = 0
    # 1. Permutations
    # top, right, bottom, left
    w.permutation do |(t,r,b,l)|
        ttr, rtr = 0, 0 # top_top_right, right_top_right
        rrb, brb = 0, 0 # right_right_bottom, bottom_right_bottom
        bbl, lbl = 0, 0 #bottom_bottom_left, left_bottom_left
        llt, tlt = 0, 0 # left_left_top, top_left_top

        # delta: vertical_delta, horizontal_delta
        vd, hd = 0, 0

        # last indexes
        tl, rl, bl, ll = (t.size-1), (r.size-1), (b.size-1), (l.size-1)
        
        # 2. Define top_top_right ttr
        (2..tl).each do |ttr|
        
        # 3. Define right_top_right rtr
        (0..(rl-3)).each do |rtr|
            if(t[ttr] == r[rtr])
                p [ttr,rtr,t[ttr],t.join,r.join]
        # 4. Define right_right_bottom rrb
        
            end # if
        end # ttr
        end # rtr
        f = nil

    end
6
end


require 'minitest/autorun'

describe "crossword Formation" do
    it "first test" do
        a = ["crossword", 
            "square", 
            "formation", 
            "something"]
        assert_equal crosswordFormation(a), 6
    end
end