class Variant < ApplicationRecord
  belongs_to :product
  belongs_to :color
  belongs_to :size

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items, dependent: :destroy


  def to_s
    self.product.name
  end

  def description
    self.product.description
  end

  def stock
    self.product.stock
  end

  def price
    self.price
  end

end
