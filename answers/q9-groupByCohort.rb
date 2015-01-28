#Q9 Once you complete the previous exercise, change the way the users are displayed: print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.

#======
=begin my original solution looked like this
find all the unique cohorts

cohorts = []
students.each do |i|
  cohorts << i[2]
  cohorts.uniq!
end

then iterate over the students table and build a new array using each unique cohort
cohorts.each do |i|
  students.each do |n|
    if n.fetch(2) == i
      students_grouped << n
    end
  end
end

googled and found that there is a group_by methody so used that instead
=end



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
  puts "To finish, just hit the return key twice"
  students = []#create an empty array
  keyArray = [:hobbies, :COB,:height]

  loop do #loop while the name is not empty repeat this code http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    #get user details
    temp = Hash.new#used to capture the each student
    puts 'Enter first name and then the cohort: '
      name, cohort = gets.split.map{|i| i.to_sym} #split will break the text up into an array and each element will go to each variable. Split defaults on whitespace. map { |i| i.to_s } same as map(&:to_s)
    break if name.nil? #condition to exit the loop
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

    puts "Press Enter to add student #{name} else type 'DEL' to remove"
    update = gets.chomp.downcase
    next if update == 'del'#restart the loop and discard the last student

    #add the student has to the array
    students << temp
    puts "now we have #{students.length} students"
  end

  #returns the array of students and groups them by cohort.
    students.group_by{|key| key[:cohort]}.values.flatten#had to flatten as it puts it an array when returned.

end


students = input_students
print_header
print(students)
print_footer(students)
