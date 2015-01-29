
#Right now our students disappear every time we terminate the program because the data is stored in memory.
#Let's persist it to the disk every time the user enters a new student. We'll store the data in a text file in the
#same directory where the program is.

@students = []#this @students[] is now global and accessible to all methods
@keyArray = [:hobbies, :COB,:height]#additional attributes to get from the student
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)#becasue we are sending ARGV from the command line we need to tell gets to only read from the keyboard with STDIN.gets
  end
end

def print_menu
  puts "1. Input Students"
  puts "2. Show the Students"
  puts "3. Save the inputs to students.csv"
  puts "4. Load the list from students.csv"
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
    when "4"
      student_load_file
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
  entry_instructions
  loop do #loop while the name is not empty repeat this code http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/6745
    #get user details
    puts 'Enter first name and then the cohort: '
    student_details = name_cohort_oneline

    break if student_details [:name].nil? #condition to exit the loop
    student_details.merge!(add_attributes)

    puts "Press Enter to add student #{student_details[:name]} else type 'DEL' to remove"
    update = STDIN.gets.chomp.downcase
    next if update == 'del'#restart the loop and discard the last student
    add_students(student_details)
    @plural = pluralize(@students)
    puts "now we have #{@students.length} student#{@plural}".center(50)
    puts  "============================".center(50)
  end
  #returns the array of students and groups them by cohort.
  @students = @students.group_by{|key| key[:cohort]}.values.flatten#had to flatten as it puts it an array when returned.
end


def entry_instructions
  puts "Please enter the names of the students"
  puts "To finish, just hit the return key twice"
end

def add_students student_details
  #add the student to the array
  @students << student_details
end


#capture the name an cohort from the same input line
def name_cohort_oneline
  this_student = Hash.new#used to capture each student
  name, cohort = STDIN.gets.split.map{|i| i.to_sym} #split will break the text up into an array and each element will go to each variable. Split defaults on whitespace. map { |i| i.to_s } same as map(&:to_s)
  this_student[:name] = name
  if cohort.nil?
    this_student[:cohort] = 'n/a'
  else this_student[:cohort] = cohort#default value for cohort if empty
  end
  return this_student
end

def add_attributes
  extra_attributes = {}
  @keyArray.each do |key|#enter in the remaining attributes and sets a default value
    puts "Enter #{key}:"
    val = STDIN.gets.chomp
    val = 'n/a' if val.empty?
    extra_attributes[key] = val#populating extra_attributes with the student details.
  end
  extra_attributes
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

def student_load_file(filename = "students.csv") #pass in the fillname with a default value of students.csv e.g. if we don't provite a filename then it will still run. Lookup ARGV for more info.
  file = File.open(filename, "r")
  file.readlines.each do |line|#read each line one at a time from the file.
    name, cohort, hobbies, cob, height = line.chomp.split(',')#rParallel assignment, remove the trailing \n, then split line into an array at each ",".
    add_students({:name => name, :cohort => cohort.to_sym, :hobbies => hobbies, :COB => cob, :height => height})#use the elements from the array to load the students in.
  end
  file.close#close the file.
end

def try_load_students
  filename = ARGV.first#first argument from the command line
  return if filename.nil?#leave the method if it isn't given.
  if File.exist?(filename)
    student_load_file(filename)
    puts "loaded#{@students.length} student#{@plural} from #{filename}"
  else
    puts "Sorry #{filename} does not exist"
    exit
  end
end


try_load_students
interactive_menu

