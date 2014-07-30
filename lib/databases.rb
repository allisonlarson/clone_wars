require 'rubygems'
require 'sequel'
require_relative './front_view_content'

Sequel::Model.plugin(:schema)

  if ENV['RACK_ENV'] == 'test'
    DB = Sequel.sqlite('database_test.db')
  else
    DB = Sequel.sqlite('database.db')
  end

  unless DB.table_exists? (:front_view)
    DB.create_table :front_view do
      primary_key :id
      string      :title
      text        :description
      string      :image_file
      timestamp   :created_at
      timestamp   :updated_at
  end

  DB[:front_view].insert( id: 1,
                         title:       FrontViewContent.who_we_are_title,
                         description: FrontViewContent.who_we_are_description,
                         image_file:  "who_we_are.jpg")

  DB[:front_view].insert( id: 2,
                          title:       FrontViewContent.what_we_carry_title,
                          description: FrontViewContent.what_we_carry_description)

  DB[:front_view].insert( id: 3,
                          title:       FrontViewContent.what_we_do_title,
                          description: FrontViewContent.what_we_do_description)

  DB[:front_view].insert( id: 4,
                          title:       FrontViewContent.gift_cards_title,
                          description: FrontViewContent.gift_cards_description)

  DB[:front_view].insert( id: 5,
                          title:       FrontViewContent.find_us_title,
                          description: FrontViewContent.find_us_description)
end

unless DB.table_exists? (:schedule)
  DB.create_table :schedule do
    primary_key :id
    string      :schedule
  end
end

unless DB.table_exists? (:outfits)
  DB.create_table :outfits do
    primary_key :id
    string      :image
    string      :date
  end
end

unless DB.table_exists? (:home)
  DB.create_table :home do
    primary_key :id
    string      :image_file
  end

  DB[:home].insert( id:1,
                    image_file: "home.png")
end
