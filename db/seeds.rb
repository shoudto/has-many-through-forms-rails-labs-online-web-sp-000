# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).



# How to create list of categories using a hash 

category = Hash[[
    "Florida",
    "New York",
    "Chicago"
  ].map { |category| [category, Category.find_or_create_by(name: category)] }]

