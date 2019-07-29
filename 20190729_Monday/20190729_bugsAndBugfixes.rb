p "alias x='ruby 20190729_Monday/20190729_bugsAndBugfixes.rb'"


require "minitest/autorun"
require 'ostruct'

def bugsAndBugfixes(rules)
    pattern = /1/
    formulas = rules.scan(pattern)

    res = 0
    for formula in formulas
        rolls = formula[0].empty? ? 1 : formula[0].to_i
        dieType = formula[1].to_i
        formulaMax = rolls * dieType

        if not formula[2].to_s.empty?
            if formula[2][0] == "-"
                formulaMax -= formula[2][1..-1].to_i
            else
                formulaMax += formula[2][1..-1].to_i
            end
        end

        res += formulaMax
    end

    return res
end



describe "bugsAndBugfixes" do
    it "Pass the tests" do
        [
            OpenStruct.new({
                rules: "Roll d6-3 and 4d4+3 to pick a weapon, and finish the boss with 3d7!",
                answer: 43
            }),
        ].each{|x| assert_equal x.answer, bugsAndBugfixes(x.rules)}
    end
end