require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'yaml'

require File.join(File.dirname(__FILE__), '..', 'lib', 'alchemist')


CONVERSIONS = YAML::load_file('conversions.yml')
@distance_conversions = CONVERSIONS["distance"].map {|k,v|{ k.split(" to ") => v } }

puts @distance_conversions.inspect

class AlchemistTest < Test::Unit::TestCase
  
  context "Testing Alchemist Distance Units" do
    @distance_table = Alchemist::conversion_table[:distance] 
    
    setup do
      @distance_conversions = CONVERSIONS["distance"].map {|k,v|{ k.split(" to ") => v } }
    end
    
    @distance_table.keys.each do |from|
      @distance_table.keys.each do |to|
        unless from == to
          should "convert #{from} to #{to}" do  
            assert_in_delta 1.send(from).to.send(to).to_f, @distance_conversions[[from.to_s,to.to_s]], 0.0000001
          end 
        end
      end
    end
  end
  
end