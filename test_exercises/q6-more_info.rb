#q7 Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
#q8 Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.

def print_header
  puts  "The students of my cohort at Makers Academy".center(50)
  puts "-------------------------".center(50)
end



def print(students)
  countlist = students.dup#without countlist just refs students and the shift will actually change students. Use 'dup' to make a copy of students and assign it to 'countlist'. Ruby passed by reference

    until countlist.length == 0 do
      student = countlist.shift
      if student[:name].length < 12
        puts "#{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]} #{student[:countryOfBirth]} #{student[:height]}".center(50) #using a hash makes it better understood what we are doing.
      end
  end
end

def print_footer(names)
  #finally, we print the total
  puts "Overall we have #{names.length} great students".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return key twice"
  students = []#create an empty array

  loop do #loop while the name is not empty repeat this code http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    #get user details
    puts 'Enter first name: '
      name = gets.chomp
    break if name.empty?#condition to exit the loop
    puts 'Enter hobbies: '
      hobbies = gets.chomp
    puts 'Enter Country of Birth: '
      countryOfBirth = gets.chomp
    puts 'Enter your height: '
      height = gets.chomp
    #add the student has to the array
    students << {:name => name, :cohort => 'november',:hobbies => hobbies, :countryOfBirth => countryOfBirth, :height => height}
    puts "now we have #{students.length} students"
  end

    students#returns the array of students

end


students = input_students
print_header
print(students)
print_footer(students)
