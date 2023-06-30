CREATE TABLE "customer_behavior" AS
SELECT 
    c.*,
    g."geolocation_lat",
    g."geolocation_lng",
    od."product_id",
    od."seller_id",
    od."price",
    od."freight_value",
    op."payment_type",
    op."payment_installments",
    op."payment_value",
    orv."review_score"
FROM "olist_customers" c
LEFT JOIN "customers_geolocation" g ON c."customer_zip_code_prefix" = g."customer_zip_code_prefix"
LEFT JOIN "orders_details" od ON c."customer_id" = od."customer_id"
LEFT JOIN "order_payments" op ON c."customer_id" = op."customer_id"
LEFT JOIN "order_reviews" orv ON c."customer_id" = orv."customer_id"
;

CREATE TABLE "geographical_performance" AS
SELECT 
    g.*,
    od."product_id",
    od."seller_id",
    od."price",
    od."freight_value",
    op."payment_type",
    op."payment_installments",
    op."payment_value",
    orv."review_score"
FROM "customers_geolocation" g
LEFT JOIN "orders_details" od ON g."customer_id" = od."customer_id"
LEFT JOIN "order_payments" op ON g."customer_id" = op."customer_id"
LEFT JOIN "order_reviews" orv ON g."customer_id" = orv."customer_id"
;

CREATE TABLE "product_performance" AS
SELECT 
    p.*,
    od."order_id",
    od."seller_id",
    od."price",
    od."freight_value",
    op."payment_type",
    op."payment_installments",
    op."payment_value",
    orv."review_score"
FROM "olist_products" p
LEFT JOIN "orders_details" od ON p."product_id" = od."product_id"
LEFT JOIN "order_payments" op ON p."product_id" = op."order_id"
LEFT JOIN "order_reviews" orv ON p."product_id" = orv."order_id"
;
