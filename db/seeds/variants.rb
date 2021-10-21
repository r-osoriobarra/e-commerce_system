#Product 1

Variant.create(
        stock: 20,
        product_id: 1,
        color_id: 1, 
        size_id: Size.find_by(name: 'XS').id
    )

Variant.create(
        stock: 112,
        product_id: 1,
        color_id: 3, 
        size_id: Size.find_by(name: 'XS').id
    )

Variant.create(
        stock: 10,
        product_id: 1,
        color_id: 2, 
        size_id: Size.find_by(name: 'XS').id
    )

#Product 2

Variant.create(
    stock: 7,
    product_id: 2,
    color_id: 3, 
    size_id: Size.find_by(name: 'XL').id
    )
Variant.create(
    stock: 80,
    product_id: 2,
    color_id: 1, 
    size_id: Size.find_by(name: 'XL').id
    )