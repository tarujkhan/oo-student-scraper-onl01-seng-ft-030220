require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
     students = []
    html = open(index_url)
    index = Nokogiri::HTML(html)
    index.css("div.roster-cards-container").each do |student|
      #binding.pry
      student_details = []
      student_details[:name].to_i = student.css("h4.student-name").text
      student_details[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_details[:profile_url] = './fixtures/student-site/' + profile_path
      students << student_details
       new_student = {student => "h4.student-name"}
    new_location = {location => "p.student-location"}
    new_profile = {profile =>  './fixtures/student-site/'}
    students << new_student && new_profile && new_location
   end
    students
  end

  def self.scrape_profile_page(profile_url)
    student_profile = {}
    html = open(profile_url)
    profile = Nokogiri::HTML(html)

    # Social Links

    profile.css("div.main-wrapper.profile .social-icon-container a").each do |social|
      if social.attribute("href").value.include?("twitter")
        student_profile[:twitter] = social.attribute("href").value
      elsif social.attribute("href").value.include?("linkedin")
        student_profile[:linkedin] = social.attribute("href").value
      elsif social.attribute("href").value.include?("github")
        student_profile[:github] = social.attribute("href").value
      else
        student_profile[:blog] = social.attribute("href").value
      end
    end

    student_profile[:profile_quote] = profile.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text
    student_profile[:bio] = profile.css("div.main-wrapper.profile .description-holder p").text

    student_profile
  end


end 
