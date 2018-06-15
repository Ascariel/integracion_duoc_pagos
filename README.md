# Estructura DB

* User
    - email
    - password
    - name
    - phone
    - stripe_customer_id

* Card
    - user_id
    - stripe_card_id
    - last_4
    - brand
    - fingerprint
    - expiry_year
    - expiry_month
    - status

* Category
    - name
    - description

* Product
    - description
    - name
    - category_id
    - image_url
    - price_dollars

* Billing
    - total_price
    - user_id
    - purchase_date
    - payment_status
    - status [failed, pending, paid, delivered]
    - order_code

* BillingDetail
    - billing_id
    - product_id
    - total_price
    - unit_price
    - quantity
