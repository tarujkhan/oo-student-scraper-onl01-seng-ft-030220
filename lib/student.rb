class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    
  end

  def self.create_from_collection(students_array)
    student_hash.each {|k, v| self.send(("#{k}="), v)}
    @@all << self
    
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |k, v|
      self.send(("#{k}="), v)
    end
    self
    
  end

  def self.all
    @@all
  end
  
  def new
  new_student = self.new({:name => :location})
end

end