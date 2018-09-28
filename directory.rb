
# add interactive menu
def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I dont't know what you mean, try again."
    end
  end
end


# to print total students

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  students.to_enum.with_index(1).each {|value, index| puts "#{index}. #{value[:name]}"}
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

students = input_students
print_header
print(students)
print_footer(students)
save_students
