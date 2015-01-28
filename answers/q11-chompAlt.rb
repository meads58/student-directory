#Q11 We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).
#======
=begin

Replaced chomp with 'gsub(/\n/,'')'.

This looks for a \n and replaces it with ''.
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
  puts "=======================".center(50)
  puts "Overall we have #{names.length} great student#{@plural}".center(50)
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
      val = gets.gsub(/\n/,'').to_sym
      val = 'n/a' if val.empty?
      temp[key] = val
    end

    puts "Press Enter to add student #{name} else type 'DEL' to remove"
    update = gets.gsub(/\n/,'').downcase
    next if update == 'del'#restart the loop and discard the last student

    #add the student has to the array
    students << temp
    @plural = pluralize(students)
    puts "now we have #{students.length} student#{@plural}".center(50)
    puts "============================".center(50)
  end

  #returns the array of students and groups them by cohort.
    return students.group_by{|key| key[:cohort]}.values.flatten#had to flatten as it puts it an array when returned.
end

#will check the student count and return a 's' to pluralize the word with an s
def pluralize student_list
  if student_list.length > 1
    return 's'
  else ''
  end
end





students = input_students
print_header
print(students)
print_footer(students)
