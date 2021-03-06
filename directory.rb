require 'csv'

@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
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
    load_students
  when "9"
    end_program
  else
    print_invalid_menu_selection
  end
end

def show_students
  print_header
  print_students
  print_footer
end

def print_invalid_menu_selection
  puts "I dont't know what you meant, try again."
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def end_program
  puts "Exiting... Thanks for using our app!"
  exit
end

def print_students
  all_cohorts = []
  @students.each { |student|
    cohort = student[:cohort]
    if !all_cohorts.include? cohort
      all_cohorts.push(cohort)
    end
  }

  all_cohorts.each { |cohort|
    puts "#{cohort} cohort students:"

    @students.each { |student|
      if cohort == student[:cohort]
        puts student[:name]
      end
    }
  }
end

def print_footer
  if @students.empty?
    puts "We have no students yet"
  elsif @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def input_cohort
  valid_cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  puts "Please enter the cohort (empty will default to november)"
  cohort = STDIN.gets.chomp.to_sym
  if cohort.empty?
    :november
  elsif valid_cohorts.include? cohort
    cohort
  else
    puts "Invalid cohort"
    input_cohort
  end
end

def input_students
  while true do
    puts "Please enter the name of the student"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp

    if name.empty?
      break
    end

    add_student(name, input_cohort)

    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
  end
end

def input_filename
  puts "Please enter the filename (empty defaults to students.csv)"
  filename = STDIN.gets.chomp

  if filename.empty?
    filename = "students.csv"
  end

  filename
end

def save_students
  filename = input_filename

  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end

  if @students.count == 1
    puts "Saved 1 student"
  else
    puts "Saved #{@students.count} students"
  end
end

def load_students
  filename = input_filename

  if File.exists?(filename)
    load_students_from(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
  end
end

def load_students_from(filename)
  @students.clear

  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student(name, cohort.to_sym)
  end

  if @students.count == 1
    puts "Loaded 1 student from #{filename}"
  else
    puts "Loaded #{@students.count} students from #{filename}"
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    return if !File.exists?("students.csv")

    filename = "students.csv"
  end

  if File.exists?(filename)
    load_students_from(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
