require 'rubygems'
require 'test/unit'
require 'shoulda'
require '../lib/alchemist'
class AlchemistTest < Test::Unit::TestCase
  @conversions = {"meters-miles"=> 0.000621371192237334 }
  context "Testing Alchemist Distance Units" do
    @distance_table = Alchemist::conversion_table[:distance] 
    setup do
      @conversions = {"meters-miles"=> 0.000621371192237334 }
    end
    
    @distance_table.keys.each do |from|
      @distance_table.keys.each do |to|
        unless from == to
          should "convert #{from} to #{to}" do  
  
            assert_in_delta 1.send(from).to.send(to).to_f, @conversions["#{from.to_s}-#{to.to_s}"], 0.0000001
  
          end 
        end
      end
    end
  
  end
  
  
end