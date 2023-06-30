CREATE TABLE "customers_geolocation" AS 
SELECT 
    c.*, 
    g."geolocation_lat",
    g."geolocation_lng",
    g."geolocation_city",
    g."geolocation_state"
FROM "olist_customers" c
LEFT JOIN "olist_geolocation" g ON c."customer_zip_code_prefix" = g."geolocation_zip_code_prefix"
;

CREATE TABLE "order_payments" AS
SELECT 
    o.*, 
    p."payment_sequential", 
    p."payment_type", 
    p."payment_installments", 
    p."payment_value"
FROM "olist_orders" o
LEFT JOIN "olist_order_payments" p ON o."order_id" = p."order_id"
;

CREATE TABLE "order_reviews" AS
SELECT 
    o.*, 
    r."review_score", 
    r."review_comment_title", 
    r."review_comment_message", 
    r."review_creation_date", 
    r."review_answer_timestamp"
FROM "olist_orders" o
LEFT JOIN "olist_order_reviews" r ON o."order_id" = r."order_id"
;

CREATE TABLE "orders_details" AS
SELECT 
    o.*, 
    i."product_id", 
    i."seller_id", 
    i."price", 
    i."freight_value",
    p."product_category_name",
    p."product_photos_qty",
    p."product_weight_g",
    p."product_length_cm",
    p."product_height_cm",
    p."product_width_cm"
FROM "olist_orders" o
LEFT JOIN "olist_order_items" i ON o."order_id" = i."order_id"
LEFT JOIN "olist_products" p ON i."product_id" = p."product_id"
