require './lib/jobs'

# Test cases
input = ("a".."f").to_a
example = [" ", "c", "f", "a", "b", " "]
same_key = [" ", " ", "c", " ", " ", " "]
circular_dependency = [" ", "c", "f", "a", " ", "b"]
nested_array_input = [["a", "b"], ["c", "d"]]
nested_array = ["a", "b"]
standard_alphabet_array = Jobs.new.standard_alphabet_array
random_generated_alphabet_array = Jobs.new.random_generated_alphabet_array

describe 'jobs' do
    it "combines two arrays" do
        array = Jobs.new.sort_jobs(input, example)
        expect(array).to be_an_instance_of(Array)
    end

    it "should return a new random generated alphabet as an array" do
        array = Jobs.new.random_generated_alphabet_array
        expect(array).to be_an_instance_of(Array)
    end

    it "random generated alphabet should return a new alphabet array containing letters and spaces" do
        array = Jobs.new.random_generated_alphabet_array
        expect(array.flatten.to_s).to match(/[a-z\s]/)
    end 

    it "should return an index of a nested array" do
        expect(Jobs.new.find_index(nested_array_input, nested_array)).to be_a(Numeric)
    end

    it "should check if a nested array is included and always return false" do
        expect(Jobs.new.check_if_include(nested_array_input, nested_array)).to be_falsey
    end

    it "should return an error if a key == value" do

    end

    it "should return an error if there is circular dependency" do

    end

    it "should return an array containing the 26 letters of the alphabet" do

    end
end