#Modify your program to only print the students whose name is shorter than 12 characters.

def print_header
	puts  "The students of my cohort at Makers Academy"
	puts "-------------------------"
end

def print(students)
	students.each do |student|
		if student[:name].length < 12 #added an if condition to filter out the names longer that 11 chars
			puts "#{student[:name]} (#{student[:cohort]} cohort)" #using a hash makes it better understood what we are doing.
		end
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
