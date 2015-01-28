#Can you make the program do exactly what it does now without using any "puts" statement? What would be the alternative?
#The stadard print method had been overridden so created a new method call print_out which alls kernal.print and then adds on a new line \n.

def print_out line
	Kernel.print "#{line}\n"
end

def print_header
	print_out  "The students of my cohort at Makers Academy"
	print_out "-------------------------"
end

def print(students)
	students.each do |student|
	print_out "#{student[:name]} (#{student[:cohort]} cohort)" #using a hash makes it better understood what we are doing.
	end
end

def print_footer(names)
	#finally, we print the total
	print_out "Overall we have #{names.length} great students"
end

def input_students
	print_out "Please enter the names of the students"
	print_out "To finish, just hit the return key twice"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty repeat this code
	while !name.empty? do
		#add the student has to the array
		students << {:name => name, :cohort => 'november'}
		print_out "now we have #{students.length} students"
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
