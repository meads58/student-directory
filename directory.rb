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

puts  "The students of my cohort at Makers Academy"
puts "-------------------------"
students.each do |student|
	puts student
end

#finally, we print the total
puts "Overall we have #{students.length} great students"


