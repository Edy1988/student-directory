# start with a list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norma Bates"
]
# to print total students

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(names)
  names.each do |name|
    puts names
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(names)
print_footer(students)
