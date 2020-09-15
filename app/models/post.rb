class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  # accepts_nested_attributes_for :categories # what method does this add?

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, categories_attributes|
      if categories_attributes[:name].present?
        category = Category.find_or_create_by(name: categories_attributes[:name])
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end
    end
  end
end

# If I use 'value' for 'categories_attributes' I want to retrieve the array 
# DO NOT CREATE A CATEGORY IF IT DOESN'T NAME 
# But also don't add a category to a post if it already has it.
# How do I check if this post has this category already?