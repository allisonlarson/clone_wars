require 'rubygems'
require 'sequel'
require_relative './front_view_content'

Sequel::Model.plugin(:schema)

def self.unless_test(&block)
  if ENV['test']
    block.call
  else
    nil
  end
end

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
                         image_file:  unless_test { "who_we_are.jpg" })


  DB[:front_view].insert( id: 2,
                          title:       FrontViewContent.what_we_carry_title,
                          description: FrontViewContent.what_we_carry_description,
                          image_file:  unless_test { "what_we_carry.jpg" })

  DB[:front_view].insert( id: 3,
                          title:       FrontViewContent.what_we_do_title,
                          description: FrontViewContent.what_we_do_description,
                          image_file:  unless_test {"what_we_do.jpg"})

  DB[:front_view].insert( id: 4,
                          title:       FrontViewContent.gift_cards_title,
                          description: FrontViewContent.gift_cards_description,
                          image_file:  unless_test {"gift_cards.jpg"})

  DB[:front_view].insert( id: 5,
                          title:       FrontViewContent.find_us_title,
                          description: FrontViewContent.find_us_description,
                          image_file:  unless_test {"find_us.jpg"})

  DB[:front_view].insert( id: 6,
                          title:       FrontViewContent.mvp_title,
                          description: FrontViewContent.mvp_description,
                          image_file:  unless_test {"mvp.jpg"})

end

unless DB.table_exists? (:blogger)
  DB.create_table :blogger do
    primary_key  :id
    string       :title
    string       :author
    text         :content
    timestamp    :created_at
    timestamp    :updated_at
  end

  DB[:blogger].insert( id: 1,
                          title:      FrontViewContent.blog_title_1,
                          author:     FrontViewContent.blog_author_1,
                          content:    FrontViewContent.blog_content_1,
                          created_at: Time.now.to_s)

  DB[:blogger].insert( id: 2,
                          title:      FrontViewContent.blog_title_2,
                          author:     FrontViewContent.blog_author_2,
                          content:    FrontViewContent.blog_content_2,
                          created_at: Time.now.to_s)
end

unless DB.table_exists? (:schedule)
  DB.create_table :schedule do
    primary_key :id
    string      :schedule
  end

  DB[:schedule].insert(id:1,
                      schedule: 'Mon-Fri 10am-6pm | Sat 10am-5:30pm')
end

unless DB.table_exists? (:outfits)
  DB.create_table :outfits do
    primary_key :id
    string      :image_file
    string      :date
  end

  DB[:outfits].insert( id: 1,
                          image_file:   "justin.jpg",
                          date:         "July 31, 2014")

  DB[:outfits].insert( id: 2,
                          image_file:   "old_polo.jpg",
                          date:         "March 25, 1914")

  DB[:outfits].insert( id: 3,
                          image_file:   "watts_night.jpg",
                          date:         "March 25, 1985")

  DB[:outfits].insert( id: 4,
                          image_file:   "alli_lane.jpg",
                          date:         "September 28, 1988")

  DB[:outfits].insert( id: 5,
                          image_file:   "horacio_jobs.jpg",
                          date:         "January 5, 1972")



end

unless DB.table_exists? (:home)
  DB.create_table :home do
    primary_key :id
    string      :image_file
  end

  DB[:home].insert( id:1,
                    image_file: "home.png")
end
