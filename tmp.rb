require 'pp'
require 'colorize'
# https://app.codesignal.com/interview-practice/task/yM4uWYeQTHzYewW9H

puts "This is Cript"

require "minitest/autorun"

module Cripta
    class String < ::String
        def self.set_map array
            @@map = array.to_h
        end
        def decr
            map = @@map
            self.chars.map{|x| map[x]}.join
        end
    end
end
def convert_array (array,solution)
    Cripta::String.set_map solution
    array.map{|x| Cripta::String.new(x).decr}
end
def decript(str, solution)
    map = Hash[*solution.flatten] 
    str.chars.map{|x| map[x]}.join
end
def isCryptSolution(crypt, solution)
    tmp = crypt.map{|x| decript(x,solution)}
    return true if  tmp.all?{|x| x == "0"}
    return false if ?0 == tmp[0][0] || ?0 == tmp[1][0] || ?0 == tmp[2][0]
    tmp[2].to_i == tmp[0].to_i + tmp[1].to_i
end
describe "test" do
    before do
        @solution = [["O","0"], 
        ["M","1"], 
        ["Y","2"], 
        ["E","5"], 
        ["N","6"], 
        ["D","7"], 
        ["R","8"], 
        ["S","9"]]
        @crypt = ["SEND", "MORE", "MONEY"] 
    end
    it "solution must me array" do
        assert_kind_of Array, @solution
    end
    it "string shuld be string" do
        assert_equal "test", String.new("test")
    end
    it "Decript must wokr" do
        Cripta::String.set_map @solution
        assert_kind_of String, Cripta::String.new("M").decr
    end
    it "convert to digit" do
        tmp = convert_array(@crypt,@solution)
        assert_kind_of String, tmp[0]
    end
    it "should return true" do
        assert isCryptSolution(@crypt, @solution)
    end
    it "shuold fail because of leading zeros" do
        crypt = ["TEN", "TWO", "ONE"] 
        solution = [['O', '1'],
        ['T', '0'],
        ['W', '9'],
        ['E', '5'],
        ['N', '4']]
        refute isCryptSolution(crypt, solution)
    end
end