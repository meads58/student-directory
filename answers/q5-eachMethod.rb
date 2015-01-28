#Rewrite the each() method that prints all students using "while" or "until" control flow methods

def print_header
	puts  "The students of my cohort at Makers Academy"
	puts "-------------------------"
end

def print(students)
	countlist = students.dup#without countlist just refs students and the shift will actually change students. Use 'dup' to make a copy of students and assign it to 'countlist'. Ruby passed by reference
		until countlist.length == 0 do
			student = countlist.shift
			puts "#{student[:name]} (#{student[:cohort]} cohort)" #using a hash makes it better understood what we are doing.
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
