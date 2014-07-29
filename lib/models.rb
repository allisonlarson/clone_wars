require 'rubygems'
require 'sequel'

Sequel::Model.plugin(:schema)
DB = Sequel.sqlite('database.db')

unless DB.table_exists? (:front_view)
  DB.create_table :front_view do
    primary_key :id
    string      :title,       :null => false
    text        :description, :null => false
    string      :image_file
    timestamp   :created_at
    timestamp   :updated_at
  end


unless DB.table_exists? (:blogger)
  DB.create_table :front_view do
    primary_key  :id
    string       :title
    string       :author
    text
  end
end
class FrontView < Sequel::Model(:front_view)
end
