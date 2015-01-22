#lets puta all the students in an array 
students = [
 "Dr Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratchet",
 "Michael Corleone",
 "Alex De Large",
 "The Alien",
 "The Terminator",
 "Freddy Kruger",
 "The Joker"
	]

def print_header
puts  "The students of my cohort at Makers Academy"
puts "-------------------------"
end	

def print(names)
	names.each do |name|
		puts name
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



