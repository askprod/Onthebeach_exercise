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
end
