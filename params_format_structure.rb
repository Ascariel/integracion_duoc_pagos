# EMAIL PARAMS
email_params = {
  name: 'Pablo Cangas',
  email: 'pablocangas@gmail.com',
  purchase_date: '13-06-2018',
  total_price: 15000,
  order_code: '#8798234986879',
  billing_details: [
    # Arreglo con la estructura de los detalles individuales
    {
      name: 'Hamburguesa X',
      unit_price: 3000,
      quantity: 3,
      product_total_price: 9000
    },
    {
      name: 'Fanta',
      unit_price: 1000,
      quantity: 3,
      product_total_price: 3000
    },
    {
      name: 'Papas Chicas',
      unit_price: 1500,
      quantity: 2,
      product_total_price: 3000
    }
  ]
}













r = {
  name: 'Pablo Cangas',
  email: 'pablocangas@gmail.com',
  purchase_date: '13-06-2018',
  total_price: 15000,
  order_code: '#8798234986879',
  billing_details: [
    {
      name: 'Hamburguesa X',
      unit_price: 3000,
      quantity: 3,
      product_total_price: 9000
    },
    {
      name: 'Fanta',
      unit_price: 1000,
      quantity: 3,
      product_total_price: 3000
    },
    {
      name: 'Papas Chicas',
      unit_price: 1500,
      quantity: 2,
      product_total_price: 3000
    }
  ]
}


puts email_params









{
  name: current_user.name,
  email: current_user.email,
  purchase_date: billing.purchase_date.to_date,
  total_price: billing.total_price,
  order_code: billing.order_code,
  billing_details: {
    name: product.name,
    unit_price: product.price_clp,
    quantity: billing_detail.quantity,
    product_total_price: billing_detail.total_price
  }
}
