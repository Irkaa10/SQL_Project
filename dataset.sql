-- Inserting rows into the products table
INSERT INTO products (id_product, title, description, unit_price, remaining_stock)
VALUES (product_id_sequence.NEXTVAL, 'Product 1', 'Description 1', 19.99, 5);

INSERT INTO products (id_product, title, description, unit_price, remaining_stock)
VALUES (product_id_sequence.NEXTVAL, 'Product 2', 'Description 2', 29.99, 20);

INSERT INTO products (id_product, title, description, unit_price, remaining_stock)
VALUES (product_id_sequence.NEXTVAL, 'Product 3', 'Description 3', 39.99, 0);

INSERT INTO products (id_product, title, description, unit_price, remaining_stock)
VALUES (product_id_sequence.NEXTVAL, 'Product 4', 'Description 4', 49.99, 30);

INSERT INTO products (id_product, title, description, unit_price, remaining_stock)
VALUES (product_id_sequence.NEXTVAL, 'Product 5', 'Description 5', 59.99, 3);


-- Inserting rows into the categories table
INSERT INTO categories (id_category, category_name)
VALUES (category_id_sequence.NEXTVAL, 'category 1');

INSERT INTO categories (id_category, category_name)
VALUES (category_id_sequence.NEXTVAL, 'category 2');

INSERT INTO categories (id_category, category_name)
VALUES (category_id_sequence.NEXTVAL, 'category 3');

INSERT INTO categories (id_category, category_name)
VALUES (category_id_sequence.NEXTVAL, 'category 4');

INSERT INTO categories (id_category, category_name)
VALUES (category_id_sequence.NEXTVAL, 'category 5');


-- Inserting rows into the product_categories table
INSERT INTO product_categories (id_product, id_category)
VALUES (1, 1); 

INSERT INTO product_categories (id_product, id_category)
VALUES (1, 2);

INSERT INTO product_categories (id_product, id_category)
VALUES (2, 2);

INSERT INTO product_categories (id_product, id_category)
VALUES (2, 3);

INSERT INTO product_categories (id_product, id_category)
VALUES (3, 1);

INSERT INTO product_categories (id_product, id_category)
VALUES (3, 3);

INSERT INTO product_categories (id_product, id_category)
VALUES (4, 4);

INSERT INTO product_categories (id_product, id_category)
VALUES (5, 5);


-- Inserting rows into the promotions table
INSERT INTO promotions (id_promotion, id_product, start_date, end_date, promotion_price)
VALUES (promotion_id_sequence.NEXTVAL, 1, TO_DATE('2023-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1.99);

INSERT INTO promotions (id_promotion, id_product, start_date, end_date, promotion_price)
VALUES (promotion_id_sequence.NEXTVAL, 2, TO_DATE('2023-06-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-06-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6.99);

INSERT INTO promotions (id_promotion, id_product, start_date, end_date, promotion_price)
VALUES (promotion_id_sequence.NEXTVAL, 3, TO_DATE('2023-02-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2.99);

INSERT INTO promotions (id_promotion, id_product, start_date, end_date, promotion_price)
VALUES (promotion_id_sequence.NEXTVAL, 4, TO_DATE('2023-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-07-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6.99);

INSERT INTO promotions (id_promotion, id_product, start_date, end_date, promotion_price)
VALUES (promotion_id_sequence.NEXTVAL, 5, TO_DATE('2023-12-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2023-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.99);


-- Inserting rows into the users table
INSERT INTO users (id_user, last_name, first_name, email, registration_date)
VALUES (user_id_sequence.NEXTVAL, 'Doe', 'John', 'john.doe@example.com', CURRENT_TIMESTAMP);

INSERT INTO users (id_user, last_name, first_name, email, registration_date)
VALUES (user_id_sequence.NEXTVAL, 'Smith', 'Jane', 'jane.smith@example.com', CURRENT_TIMESTAMP);

INSERT INTO users (id_user, last_name, first_name, email, registration_date)
VALUES (user_id_sequence.NEXTVAL, 'Johnson', 'Robert', 'robert.johnson@example.com', CURRENT_TIMESTAMP);


-- Inserting rows into the orders table
-- User 1
INSERT INTO orders (id_order, id_user, purchase_date) VALUES (order_id_sequence.NEXTVAL, 1, CURRENT_TIMESTAMP - INTERVAL '8' DAY);
INSERT INTO orders (id_order, id_user, purchase_date) VALUES (order_id_sequence.NEXTVAL, 1, NULL);

-- User 2
INSERT INTO orders (id_order, id_user, purchase_date) VALUES (order_id_sequence.NEXTVAL, 2, CURRENT_TIMESTAMP - INTERVAL '11' DAY);
INSERT INTO orders (id_order, id_user, purchase_date) VALUES (order_id_sequence.NEXTVAL, 2, NULL);

-- User 3
INSERT INTO orders (id_order, id_user, purchase_date) VALUES (order_id_sequence.NEXTVAL, 3, CURRENT_TIMESTAMP - INTERVAL '2' DAY);


-- Inserting rows into the sold_articles table
INSERT INTO sold_articles (id_article, id_order, id_product, quantity_sold, unit_price)
VALUES (sold_article_id_sequence.NEXTVAL, 1, 1, 3, 1.99);

INSERT INTO sold_articles (id_article, id_order, id_product, quantity_sold, unit_price)
VALUES (sold_article_id_sequence.NEXTVAL, 1, 2, 1, 29.99);

INSERT INTO sold_articles (id_article, id_order, id_product, quantity_sold, unit_price)
VALUES (sold_article_id_sequence.NEXTVAL, 3, 5, 1, 3.99);

INSERT INTO sold_articles (id_article, id_order, id_product, quantity_sold, unit_price)
VALUES (sold_article_id_sequence.NEXTVAL, 5, 4, 1, 49.99);