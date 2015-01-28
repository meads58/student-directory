#q6 Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
#q7 Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
#q8 In the input_students method the cohort value is hard-coded. How can you ask for both the name and the cohort? - gets.split.map{|i| i/to_s}
# What if one of the values is empty? - Seems to work fine, just leaves it blank.
# Can you supply a default value?
# The input will be given to you as a string?
#How will you convert it to a symbol? Use to_sym to convert to a symbol.
#What if the user makes a typo? next allows you to restart the loop and not insert a student.

def print_header
  puts  "The students of my cohort at Makers Academy".center(50)
  puts "-------------------------".center(50)
end



def print(students)
  countlist = students.dup#without countlist just refs students and the shift will actually change students. Use 'dup' to make a copy of students and assign it to 'countlist'. Ruby passed by reference

    until countlist.length == 0 do
      student = countlist.shift
      if student[:name].length < 12
        puts "Name: #{student[:name]} (#{student[:cohort]} cohort) Hobbies: #{student[:hobbies]} COB: #{student[:COB]} Height: #{student[:height]}".center(50) #using a hash makes it better understood what we are doing.
      end
  end
end

def print_footer(names)
  #finally, we print the total
  puts "Overall we have #{names.length} great students".center(50)
end

def input_students
  puts "Please enter the names of the students"

  students = []#create an empty array
  keyArray = [:hobbies, :COB,:height]

  loop do #loop while the name is not empty repeat this code http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    #get user details
    temp = Hash.new#used to capture the each student
    puts "To finish, just hit the return key"
    puts 'Enter first name and then the cohort: '
    name, cohort = gets.split.map{|i| i.to_sym} #split will break the text up into an array and each element will go to each variable. Split defaults on whitespace. map { |i| i.to_s } same as map(&:to_s)
    break if name.nil? #condition to exit the loop
    puts cohort.class
    temp[:name] = name

    if cohort.nil?
      temp[:cohort] = 'n/a'
      else temp[:cohort] = cohort#default value for cohort if empty
    end

    keyArray.each do |key|#enter in the remaining attributes and sets a default value
      puts "Enter #{key}:"
      val = gets.chomp.to_sym
      val = 'n/a' if val.empty?
      temp[key] = val
    end

    puts "Press Enter to add student '#{name}' else type 'DEL' to remove"
    update = gets.chomp.downcase
    next if update == 'del'#restart the loop and discard the last student

    #add the student has to the array
    students << temp
    puts "now we have #{students.length} students".center(50)
    puts '=============='.center(50)
  end

    students#returns the array of students

end


students = input_students
print_header
print(students)
print_footer(students)
