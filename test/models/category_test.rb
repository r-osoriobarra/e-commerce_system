require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "only one parent per category" do
    parent_1 = categories(:one)
    parent_2 = categories(:two)
    category = categories(:three)

    #adding 2 parent to category
    parent_1.sub_categories << category
    parent_2.sub_categories << category

    assert_not category.category_id == parent_1.id
  end
end
