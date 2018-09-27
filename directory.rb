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
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# add a total of students using print
puts "Overall, we have #{students.count} great students."
