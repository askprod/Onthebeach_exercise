# On The Beach Graduate Scheme Exercise 

The purpose of this exercise is to see how you approach a problem, and how you solve it. We’re interested to see how you structure your Ruby code, your command of the language and good design and testing principles, bear this in mind throughout.\
HINT: Start with a method that accepts a single string argument and returns a string (or a collection) which represents the ordered sequence of jobs (since each job is a single character).\
HINT: Brownie points will be given for showing us your working (notes, commit history, some kind of idea how you approached the problem).\
HINT: We’re pretty keen on tested code.\
Have Fun.

## The Challenge

Imagine we have a list of jobs, each represented by a character. Because certain jobs must be done before others, a job may have a dependency on another job. For example, a may depend on b, meaning the final sequence of jobs should place b before a.\
If a has no dependency, the position of a in the final sequence does not matter.

### Prerequisites

Make sure you have the latest Ruby and Bundler versions installed, and follow these instructions:

To run the program, in the `lib` folder:
```
ruby jobs.rb
```
To run the tests, in the `root` folder:
```
rspec
```

In case you don't have RSpec, which should be included if you have the latest Ruby version, you can run:
```
bundle install
```

### Prerequisites

The program should generate a random alphabet and an ordered alphabet seeds and try to combine them in a nested array, with the instructions above respected.\
The fact that one of the seed is randomly generated might throw in some intended errors, if there are either a circular dependency, or a key depending on itself.\
You can run the program multiple times to get different results.
