require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AttrCurrency" do
  describe "#attr_currency" do
    before :all do
      class RateTest < Tableless
        include AttrCurrency

        column :rate, :integer  
        attr_currency :rate, :price, :total
      end

      @rate_test = RateTest.new 
    end

    it "should store rate column in cent" do
      @rate_test.rate = 100

      @rate_test.read_attribute(:rate).should == 10000
      @rate_test.rate.should == 100
    end

    it "should store price column in cent" do
      @rate_test.price = 99.99

      @rate_test.read_attribute(:price).should == 9999
      @rate_test.price.should == 99.99
    end

    it "should store total column in cent" do
      @rate_test.total = '1249.90'

      @rate_test.read_attribute(:total).should == 124990
      @rate_test.total.should == 1249.90
    end


  end
end
