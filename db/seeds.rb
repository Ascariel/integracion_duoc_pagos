
 # db:seed command (or created alongside the database with db:setup).



cat_papas = Category.find_or_create_by(name: 'Papas Fritas', description: '')
cat_hamburguesas = Category.find_or_create_by(name: 'Hamburguesas', description: '')
cat_bebidas = Category.find_or_create_by(name: 'Bebidas', description: '')

Product.find_or_create_by!(name: 'Papas Fritas XL', price_dollars: '6', description: 'Rica porcion de papas', image_url: '/assets/fries_1.jpg', category: cat_papas)
Product.find_or_create_by!(name: 'Papas Fritas Mediana', price_dollars: '4', description: 'Rica porcion de papas', image_url: '/assets/fries_2.jpg', category: cat_papas)
Product.find_or_create_by!(name: 'Papas Fritas Chicas', price_dollars: '2', description: 'Rica porcion de papas', image_url: '/assets/fries_3.jpg', category: cat_papas)

Product.find_or_create_by!(name: 'Hamburguesa Clasica', price_dollars: '8', description: 'Clasica hamburguesa!', image_url: '/assets/burger_1.jpg', category: cat_hamburguesas)
Product.find_or_create_by!(name: 'Hamburguesa Double', price_dollars: '8', description: 'Clasica hamburguesa!', image_url: '/assets/burger_2.jpg', category: cat_hamburguesas)
Product.find_or_create_by!(name: 'Hamburguesa Pollo Grill', price_dollars: '10', description: 'Clasica hamburguesa!', image_url: '/assets/burger_3.jpg', category: cat_hamburguesas)

Product.find_or_create_by!(name: 'Coca-Cola', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_1.jpg', category: cat_bebidas)
Product.find_or_create_by!(name: 'Fanta', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_2.jpg', category: cat_bebidas)
Product.find_or_create_by!(name: 'Sprite', price_dollars: '2', description: 'Bebida de medio litro', image_url: '/assets/drink_3.jpg', category: cat_bebidas)


user1 = User.create!(name: "Andrea", email: 'algo@gmail.com', phone: '23432432', password: 'passpass')

params = {
user_id: user1.id,
total_price: 20000,
status: 'pagado',
purchase_date: Time.current,
order_code: '#623648973204'
}
a = Billing.create!(params)
