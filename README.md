# e-commerce system

- 1) Modelo e-commerce, agregando las modificaciones para que los productos tengan diferentes variantes:
![modelo conceptual e-commerce](https://github.com/r-osoriobarra/models_dl/blob/main/models/e-commerce.jpg) 

- 6) Para implementar el catálogo de productos con los cambios realizados al esquema del modelo e-commerce, se realizó lo siguiente:

1. Para el catálogo sólo queremos mostrar una sola variante de cada producto. Por eso, en el método index de HomeController modificamos para que se recorra sólo la primera variante de cada producto, dado que todas demás se verán en la vista show. Para esto, se agrega el método de clase **"catalog"** en el modelo Product, que entrega la primera variante de cada producto.

```
    # /controllers/HomeController
    def index
        variants = Product.eager_load(:variants)
        @products = Product.catalog(variants)
    end

    # /models/product.rb

    def self.catalog(all_products)
        @catalog = []
        all_products.each do |product|
            @catalog << product.variants[0] if !product.variants.empty?   
        end

        return @catalog
    end

```
    
2. Para obtener datos específicos del producto, sin afectar las vistas, se añaden métodos para consulta de atributos en el modelo Variant utilizando la relación con Product:

```
    # /models/variant.rb
    
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

```

- 7) La principal modificación al modelo OrderItem es la relación que tenía con el modelo Product, ya que ahora nos interesa llenar nuestro carro de compras con productos del modelo Variant:

```
    class OrderItem < ApplicationRecord
        belongs_to :variant    # en vez de belongs_to :product
        belongs_to :order
    end
```

- 8) Para cupones VIP como RRSS, se implementa un modelo Coupon que se relaciona directamente con el modelo Order para aplicar los descuentos. El modelo Coupon tendrá 3 atributos principales
    1. type (integer): recibirá 1 o 2 dependiendo si es **RRSS** o **VIP** respectivamente.
    2. value_type (string): recibirá 1 o 2 dependiendo si es **%** o **amount** respectivamente.
    3. value (float): recibe el valor del descuento.

    Por otra parte el modelo Order recibirá como Foreign Key **coupon__id** para identificar al coupon.
    Como supuesto, se asume que una orden sólo puede recibir un sólo cupón, sea RRSS o VIP. Este último debe contar con la verificación que el usuario tiene la categoría VIP, por lo que se agrega al modelo User el atributo VIP (boolean). El diagrama actualizado del modelo e-commerce quedaría de la siguiente forma:

![modelo conceptual e-commerce coupon](https://github.com/r-osoriobarra/models_dl/blob/main/models/e-commerce-e-commerce%20cupon.jpg) 

- En resumen:
    *crear el modelo coupon
    `rails g model coupon type:integer value_type:string value:float`

    *agregar FK coupon a Order
    `rails g migration AddCouponIdToOrder coupon:references`

    *agregar relaciones entre los modelos
    ```
    # models/order.rb
        belongs_to :coupon

    # models/coupon.rb
        has_many :orders
    ```
    *Agregar restricciones para utilizar cupones vip, del tipo
    ```
        if order.coupon.type == 2 && current_user.vip
            #   utilizar para el descuento    
    ```



