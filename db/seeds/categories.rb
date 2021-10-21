Category.create(name: "Smartphones")
Category.create(name: "Shoes")
Category.create(name: "Accesories")

#create texample of category tree
category_1 = Category.create(name: "Sport")
category_2 = Category.create(name: "T-shirts")
category_3 = Category.create(name: "Running")

category_1.sub_categories << category_2
category_2.sub_categories << category_3