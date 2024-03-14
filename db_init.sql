CREATE SEQUENCE category_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

CREATE SEQUENCE order_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

CREATE SEQUENCE product_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

CREATE SEQUENCE promotion_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

CREATE SEQUENCE sold_article_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

CREATE SEQUENCE user_id_sequence
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;


-- Products table
CREATE TABLE products
(
    id_product INT DEFAULT product_id_sequence.NEXTVAL CONSTRAINT products_id_product_pk PRIMARY KEY,
    title VARCHAR(255) NOT NULL CONSTRAINT products_title_uk UNIQUE,
    description CLOB NOT NULL,
    unit_price NUMBER(10, 2) NOT NULL CONSTRAINT products_unit_price_ck CHECK (unit_price >= 0),
    remaining_stock INT NOT NULL
);

-- Categories table
CREATE TABLE categories
(
    id_category INT DEFAULT category_id_sequence.NEXTVAL CONSTRAINT categories_id_category_pk PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL CONSTRAINT categories_category_name_uk UNIQUE
);

-- Link table between products and categories (many-to-many relationship)
CREATE TABLE product_categories
(
    id_product INT CONSTRAINT product_categories_id_product_fk REFERENCES products(id_product),
    id_category INT CONSTRAINT product_categories_id_category_fk REFERENCES categories(id_category),
    CONSTRAINT product_categories_id_product_id_category_pk PRIMARY KEY (id_product, id_category)
);

-- Promotions table
CREATE TABLE promotions
(
    id_promotion INT DEFAULT promotion_id_sequence.NEXTVAL CONSTRAINT promotions_id_promotion PRIMARY KEY,
    id_product INT CONSTRAINT promotions_id_product_fk REFERENCES products(id_product),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    promotion_price NUMBER(10, 2) NOT NULL
);

-- Users table
CREATE TABLE users
(
    id_user INT DEFAULT user_id_sequence.NEXTVAL CONSTRAINT users_id_user_pk PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP NOT NULL
);

-- Orders table
CREATE TABLE orders
(
    id_order INT DEFAULT order_id_sequence.NEXTVAL CONSTRAINT orders_id_order_pk PRIMARY KEY,
    id_user INT CONSTRAINT orders_id_user REFERENCES users(id_user),
    purchase_date TIMESTAMP
);

-- Sold articles table
CREATE TABLE sold_articles
(
    id_article INT DEFAULT sold_article_id_sequence.NEXTVAL CONSTRAINT sold_articles_id_article_pk PRIMARY KEY,
    id_order INT CONSTRAINT sold_articles_id_order_fk REFERENCES orders(id_order),
    id_product INT CONSTRAINT fk_sold_articles_id_product_fk REFERENCES products(id_product),
    quantity_sold INT NOT NULL,
    unit_price NUMBER(10, 2) NOT NULL
);