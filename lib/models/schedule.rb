class Schedule < Sequel::Model(:schedule)
end

Schedule.create if Schedule[1].nil?
