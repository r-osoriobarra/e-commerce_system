class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  
  has_many :variants, dependent: :destroy


  #products catalog of index view
  def self.catalog(all_products)
    @catalog = []
    all_products.each do |product|
      @catalog << product.variants[0] if !product.variants.empty?
    end

    return @catalog
  end


end
