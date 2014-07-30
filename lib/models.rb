require 'rubygems'
require 'sequel'

Sequel::Model.plugin(:schema)
if ENV['RACK_ENV'] == 'test'
  DB = Sequel.sqlite('database_test.db')
else
  DB = Sequel.sqlite('database.db')
end

unless DB.table_exists? (:front_view)
  DB.create_table :front_view do
    primary_key :id
    string      :title       #:null => false
    text        :description #:null => false
    string      :image_file
    timestamp   :created_at
    timestamp   :updated_at
  end
end

unless DB.table_exists? (:schedule)
  DB.create_table :schedule do
    primary_key :id
    string      :schedule
  end
end

# unless DB.table_exists? (:blogger)
#   DB.create_table :front_view do


class FrontView < Sequel::Model(:front_view)
end

# Seed the database.
FrontView.create if FrontView[1].nil?
FrontView.create if FrontView[2].nil?
FrontView.create if FrontView[3].nil?
FrontView.create if FrontView[4].nil?
FrontView.create if FrontView[5].nil?

class Schedule < Sequel::Model(:schedule)
end

Schedule.create if Schedule[1].nil?
