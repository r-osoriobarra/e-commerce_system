class Category < ApplicationRecord
  has_and_belongs_to_many :products

  #self reference relation
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true,  dependent: :destroy 
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy

  #searching parent and son categories

  #return all level 1 parent categories
  scope :parent_categories, -> {where(category_id: nil)}

  #return all sons for a given category
  def self.son_categories(category)
    sons = category.sub_categories
    sons.empty? ? "This category doesn't have subcategories" : sons
  end
  
end
