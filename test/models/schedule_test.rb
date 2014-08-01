require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/models/schedule'

class ScheduleTest < Minitest::Test


  def test_it_delets_a_schedule_with_sequal_model
    attributes = {
      :schedule => 'Monday | Friday'
    }
    Schedule.create(attributes)
  end


end
