class Color < ApplicationRecord
    has_many :variants, dependent: :destroy
end
