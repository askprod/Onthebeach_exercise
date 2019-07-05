class SameKeyError < StandardError

end

class CircularError < StandardError

end

class Jobs
    def sort_jobs(a, b)
        new_array = a.zip(b)
    end

    # Generates an array from a to z
    def standard_alphabet_array
        ('a'..'z').to_a
    end

    # Generates a random alphabet array with spaces for test purposes
    def random_generated_alphabet_array
        b =  (97..122).to_a.sort{ rand() - 0.5 }[0..26].map{|x| x.chr}
        spaces = rand(0..26)
        replacements = b.sample(spaces)
        c = b.flat_map do |x|
            x.split.map { |letter| replacements.include?(letter) ? " " : letter }
        end
    end

    # Finds index of a certain nested array.
    def find_index(array, nested_array)
        found_index = array.index(nested_array)
    end

    # Checks if original array includes the nested form.
    def check_if_include(array, nested_array)
        array.include?(nested_array) == false
    end

    # Since the nested array will always be in this format [0, 1], we need 2 methods to find if the first and/or second index exists.
    # Find if index of [0] exists
    def find_nested_index_0(array, nested_array)
        @index_zero = array.index(array.detect{|z| z.include?(nested_array[0])})
    end

    #Find if index of [1] exists
    def find_nested_index_1(array, nested_array)
        @index_one = array.index(array.detect{|z| z.include?(nested_array[1])})
    end

    # Pushes at correct positions depending on index
    def insert_after_index(array, index, value)
        array.insert(index+=1, value)
    end

    def insert_before_index(array, index, value)
        array.insert(index-=1, value)
    end
end