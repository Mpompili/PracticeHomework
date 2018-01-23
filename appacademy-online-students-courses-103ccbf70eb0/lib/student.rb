class Student
  attr_accessor :first_name, :last_name, :courses
  def initialize(first, last)
    @first_name = first.to_s
    @last_name = last.to_s
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    return if self.courses.include?(course)
    raise "conflict with course" if has_conflict?(course)
    self.courses << course
    course.students << self
  end

  def course_load
    course_hsh = Hash.new(0)
    courses.each do |buggs|
      course_hsh[buggs.department] += buggs.credits
    end
    course_hsh
  end

  def has_conflict?(course)
    courses.any? do |enrolled_course|
      course.conflicts_with?(enrolled_course)
    end
  end

end
