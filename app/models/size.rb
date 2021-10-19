class Size < ApplicationRecord
    has_many :variants, dependent: :destroy
end
