#We're using the each() method to iterate over an array of students. How can you modify the program to print a number before the name of each #student, e.g. "1. Dr. Hannibal Lecter"? Hint: replace each() with each_with_index().

def print_header
	puts  "The students of my cohort at Makers Academy"
	puts "-------------------------"
end

def print(students)
	#used the array index to generate a counter and added +1 as the array index starts at 0.
	students.each_with_index do |student,i|
		puts "#{i+1}:#{student[:name]} (#{student[:cohort]} cohort)" #using a hash makes it better understood what we are doing.

	end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall we have #{names.length} great students"
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit the return key twice"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty repeat this code
	while !name.empty? do
		#add the student has to the array
		students << {:name => name, :cohort => 'november'}
		puts "now we have #{students.length} students"
		#get another name from the user
		name = gets.chomp
	end
	#returns the array of students
	students
end

students = input_students
print_header
print(students)
print_footer(students)
