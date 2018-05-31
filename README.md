# Estructura DB

* User
    email
    password
    name
    strip_customer_id

* Card
    user_id
    stripe_card_id
    last_4
    brand
    fingerprint
    expiration_year
    expiration_month
    status

* Product
    description
    name
    category_id
    image_url
    price_dollars

* Billing
    total_price
    user_id
    purchase_date
    payment_status

* BillingDetail
    user_id
    product_id
    total_price
    unit_price
    quantity
