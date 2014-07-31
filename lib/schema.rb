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
                          description: FrontViewContent.what_we_carry_description,
                          image_file:  "what_we_carry.jpg")

  DB[:front_view].insert( id: 3,
                          title:       FrontViewContent.what_we_do_title,
                          description: FrontViewContent.what_we_do_description,
                          image_file:  "what_we_do.jpg")

  DB[:front_view].insert( id: 4,
                          title:       FrontViewContent.gift_cards_title,
                          description: FrontViewContent.gift_cards_description,
                          image_file:  "gift_cards.jpg")

  DB[:front_view].insert( id: 5,
                          title:       FrontViewContent.find_us_title,
                          description: FrontViewContent.find_us_description,
                          image_file:  "find_us.jpg")

  DB[:front_view].insert( id: 6,
                          title:       FrontViewContent.mvp_title,
                          description: FrontViewContent.mvp_description,
                          image_file:  "mvp.jpg")

end

unless DB.table_exists? (:blogger)
  DB.create_table :blogger do
    primary_key  :id
    string       :title
    string       :author
    text         :content
    string       :tag
    timestamp    :created_at
    timestamp    :updated_at
  end

  DB[:blogger].insert( id: 1,
                          title:   FrontViewContent.blog_title_1,
                          author:  FrontViewContent.blog_author_1,
                          content: FrontViewContent.blog_content_1)

  DB[:blogger].insert( id: 2,
                          title:   FrontViewContent.blog_title_2,
                          author:  FrontViewContent.blog_author_2,
                          content: FrontViewContent.blog_content_2)
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
end

unless DB.table_exists? (:home)
  DB.create_table :home do
    primary_key :id
    string      :image_file
  end

  DB[:home].insert( id:1,
                    image_file: "home.png")
end
