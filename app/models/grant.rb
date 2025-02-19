class Grant < ApplicationRecord
#pre select options for form fields
=begin
FY = ["2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"]
GRANT_TYPES = ["Ahahui", "BOT Initiative", "Community Grant", "Sponsorship"]
STRATEGIC_PRIORITY = ["culture", "economic self-sufficiency", "governance", "education", "health", "land & water"]
STRATEGIC_RESULTS = ["Achieve Pae Aina Sustainability", "Build Stability in Housing", "Decrease Chronic Disease Rates", "Exceed Education Standards", "Improve Family Lifestyle", "Increase Family Income", "Participate in Culture", "Priority Level", "Value History and Culture"]
LOCATION_SELECT = ["continent", "hawaii", "international", "kauai", "lanai", "maui", "molokai", "mulitple", "oahu", "Papahanaumokuakea", "polynesia", "statewide"]

#validations for form fields
validates :fiscal_year, :grant_type, :organization, :project, :amount, :location, :strategic_priority, :strategic_results, :grantStatusID, :presence => true
=end
FY = ["2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"]
	def concatStrategic
		strategic = strategic_priority + ': ' + strategic_results
	end

	def totalCheck
		if total_served && nh_served == 0
			a = "N/A"
		else
			a = total_served.to_s + "/" + nh_served.to_s
		end
		return a
	end
	
	def humanStatus
		if grantStatusID = 1
			a = "Funded"
		else
			a = "In-Progress"
		end
		return a
	end
	
	def orgLocation
		a = organization + ' (' + location + ')'
	end
	
	#import csv file data
	#require 'csv'
	def self.import(file)
	  CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
		Grant.create! row.to_hash
	  end
	end

end
