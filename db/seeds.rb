
 # db:seed command (or created alongside the database with db:setup).

# Products
Category.create(name: 'Papas Fritas' description: '')
Category.create(name: 'Hamburguesas' description: '')
Category.create(name: 'Bebidas' description: '')

Product.find_or_create_by(name: 'Papas Fritas XL', price_dollars: '6', description: 'Rica porcion de papas', image_url: '/assets/fries_1.jpg')
Product.find_or_create_by(name: 'Papas Fritas Mediana', price_dollars: '4', description: 'Rica porcion de papas', image_url: '/assets/fries_2.jpg')
Product.find_or_create_by(name: 'Papas Fritas Chicas', price_dollars: '2', description: 'Rica porcion de papas', image_url: '/assets/fries_3.jpg')

Product.find_or_create_by(name: 'Hamburguesa Clasica', price_dollars: '8', description: 'Clasica hamburguesa!', image_url: '/assets/burger_1.jpg')
Product.find_or_create_by(name: 'Hamburguesa Double', price_dollars: '8', description: 'Clasica hamburguesa!', image_url: '/assets/burger_2.jpg')
Product.find_or_create_by(name: 'Hamburguesa Pollo Grill', price_dollars: '10', description: 'Clasica hamburguesa!', image_url: '/assets/burger_3.jpg')

Product.find_or_create_by(name: 'Coca-Cola', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_1.jpg')
Product.find_or_create_by(name: 'Fanta', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_2.jpg')
Product.find_or_create_by(name: 'Sprite', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_3.jpg')
