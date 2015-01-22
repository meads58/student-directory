#lets puta all the students in an array 
students = [
	{:name => "Dr Hannibal Lecter", :cohort => :november},
	{:name => "Darth Vader", :cohort => :november},
	{:name => "Nurse Ratchet", :cohort => :november},
	{:name => "Michael Corleone", :cohort => :november},
	{:name => "Alex De Large", :cohort => :november},
	{:name => "The Alien", :cohort => :november},
	{:name => "The Terminator", :cohort => :november},
	{:name => "Freddy Kruger", :cohort => :november},
	{:name => "The Joker", :cohort => :november}
	]

def print_header
puts  "The students of my cohort at Makers Academy"
puts "-------------------------"
end	

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)" #using a hash makes it better understood what we are doing.
	end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall we have #{names.length} great students"
end

#nothing happens untill we call the method
print_header
print(students)
print_footer(students)



