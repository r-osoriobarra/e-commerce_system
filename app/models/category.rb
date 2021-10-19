class Category < ApplicationRecord
  has_and_belongs_to_many :products

  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true,  dependent: :destroy 
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy
end
