require 'rubygems'
require 'test/unit'
require 'shoulda'
require '../lib/alchemist'
class AlchemistTest < Test::Unit::TestCase
  @conversions = {"meters-miles"=> 0.000621371192237334 }
  context "Testing Alchemist Distance Units" do
    @table = Alchemist::conversion_table[:distance] 
    #@table = {:meters => 1.0, :miles => 1609.344}
    
    setup do
      @conversions = {"meters-miles"=> 0.000621371192237334 }
    end
    
    @table.keys.each do |from|
      @table.keys.each do |to|
        unless from == to
          should "convert #{from} to #{to}" do  
  
            assert_in_delta 1.send(from).to.send(to).to_f, @conversions["#{from.to_s}-#{to.to_s}"], 0.0000001
  
          end 
        end
      end
    end
  
  end
  
  
end