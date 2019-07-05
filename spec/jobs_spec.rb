require './lib/jobs'

# Test cases
input = ("a".."f").to_a
example = [" ", "c", "f", "a", "b", " "]
same_key = [" ", " ", "c", " ", " ", " "]
circular_dependency = [" ", "c", "f", "a", " ", "b"]

describe 'jobs' do
    it "combines two arrays" do

    end

    it "should return a new random generated alphabet as an array" do

    end

    it "random generated alphabet should return a new alphabet array containing letters and spaces" do

    end 

    it "should return an error if a key == value" do

    end

    it "should return an error if there is circular dependency" do

    end

    it "should return an array containing the 26 letters of the alphabet" do

    end
end