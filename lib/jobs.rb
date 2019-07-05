class SameKeyError < StandardError
    def initialize(msg="Could not show result: a key depended on itself. Please try again.")
        super(msg)
    end
end

class CircularError < StandardError
    def initialize(msg="Could not show result: there was a circular dependency. Please try again.")
        super(msg)
    end
end

class Jobs
    def sort_jobs(a, b)
        new_array = a.zip(b)
        sort_array_by_priority(new_array)
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

    def sort_array_by_priority(array)
        sorted_array = []
        # Enumerable that becomes a negative number if there is the same value added a couple of times, to check if there is a circular dependency.
        check_infinite_loop = 1
        while sorted_array.count < array.count && check_infinite_loop > -1
                    array.each do |x|
                        if x[0] == x[1]
                            raise SameKeyError.new
                        elsif check_infinite_loop == 0
                            raise CircularError.new
                            # Checks if there is an infinite loop to return an error.
                        elsif x.include?(" ") && check_if_include(sorted_array, x)
                            sorted_array.push(x)
                            check_infinite_loop +=1
                        elsif find_nested_index_0(sorted_array, x) && check_if_include(sorted_array, x) 
                            insert_before_index(sorted_array, @index_zero, x)
                            check_infinite_loop +=1
                        elsif find_nested_index_1(sorted_array, x) && check_if_include(sorted_array, x)
                            insert_after_index(sorted_array, @index_one, x)
                            check_infinite_loop +=1
                        end
                    end
            check_infinite_loop -= 1
        end
        return sorted_array
    end
end

begin
    ordered_array = Jobs.new.standard_alphabet_array
    unordered_array = Jobs.new.random_generated_alphabet_array
    input_array = ordered_array.zip(unordered_array)
    result_array = Jobs.new.sort_jobs(ordered_array, unordered_array)
    puts "Input: \n  #{input_array}"
    puts "Result: \n #{result_array}"
    rescue SameKeyError => e
        puts e.message
    rescue CircularError => e
        puts e.message
end