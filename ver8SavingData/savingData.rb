
#Right now our students disappear every time we terminate the program because the data is stored in memory.
#Let's persist it to the disk every time the user enters a new student. We'll store the data in a text file in the
#same directory where the program is.

@students = []#this @students[] is now global and accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)#can send the selection a variable.
  end
end

def print_menu
  puts "1. Input Students"
  puts "2. Show the Students"
  puts "3. Save the inputs to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit#this will exit the program
    else
      puts "I don't know what you mean try again"
  end
end

def print_header
  puts  "The students of my cohort at Makers Academy".center(50)
  puts "-------------------------".center(50)
end



def print_student_list
  if @students.length > 0
    countlist = @students.dup#without countlist just refs students and the shift will actually change students. Use 'dup' to make a copy of students and assign it to 'countlist'. Ruby passed by reference

    until countlist.length == 0 do
      student = countlist.shift
        if student[:name].length < 12
          puts "Name: #{student[:name]} (#{student[:cohort]} cohort) Hobbies: #{student[:hobbies]} COB: #{student[:COB]} Height: #{student[:height]}".center(50) #using a hash makes it better understood what we are doing.
        end
    end
  else
    puts "No students entered".center(50)
  end
end

def print_footer
  #finally, we print the total
  puts "=======================".center(50)
  puts "Overall we have #{@students.length} great student#{@plural}".center(50)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return key twice"
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
    @students << temp
    @plural = pluralize(@students)
    puts "now we have #{@students.length} student#{@plural}".center(50)
    puts "============================".center(50)
  end

  #returns the array of students and groups them by cohort.
    return @students.group_by{|key| key[:cohort]}.values.flatten#had to flatten as it puts it an array when returned.
end

#will check the student count and return a 's' to pluralize the word with an s
def pluralize student_list
  if student_list.length > 1
    return 's'
  else ''
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv","w")#the 'w' will write to the 'students.csv' file. It will also truncate it to zero first e.g. clear everything out of this file first. If you used 'a' this would write to the end of the existing file e.g. append to the end.
  #iterate over the array of students
  @students.each do |student|
    student_date = [student[:name], student[:cohort], student[:hobbies], student[:COB], student[:height]]#here we are putting the hash elements into an array so on the next line we can convert to a string with join.
    csv_line = student_date.join(",")#join combines the array into one string uses ',' to separate the elements
    file.puts csv_line#this line calls puts but writes to the file instead of the screen.
  end
  file.close#everytime you open a file you need to close it. Until you close it you can't open it.
end



interactive_menu

