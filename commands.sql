--Queries:

--Question 1:

SELECT
    id_product,
    title,
    description,
    unit_price,
    remaining_stock,
    CASE
        WHEN remaining_stock = 0 THEN 'EMPTY'
        WHEN remaining_stock < 10 THEN 'LOW'
        ELSE NULL
    END AS stock_status
FROM
    products
WHERE
    remaining_stock = 0 OR remaining_stock < 10;


--Question 2:

SELECT
    p.title AS product_name,
    LISTAGG(c.category_name, ', ') WITHIN GROUP (ORDER BY c.category_name) AS category_list
FROM
    products p
JOIN
    product_categories pc ON p.id_product = pc.id_product
JOIN
    categories c ON pc.id_category = c.id_category
GROUP BY
    p.title;


--Question 3:

SELECT
    u.id_user,
    u.last_name,
    u.first_name,
    u.email,
    u.registration_date,
    COUNT(o.id_order) AS num_orders,
    MAX(o.purchase_date) AS last_purchase_date
FROM
    users u
LEFT JOIN
    orders o ON u.id_user = o.id_user
GROUP BY
    u.id_user, u.last_name, u.first_name, u.email, u.registration_date
ORDER BY
    u.id_user;


--Question 4:

SELECT
    p.id_product,
    p.title,
    p.unit_price AS original_price,
    COALESCE(pr.promotion_price, NULL) AS promotion_price
FROM
    products p
LEFT JOIN
    promotions pr ON p.id_product = pr.id_product
    AND CURRENT_DATE BETWEEN pr.start_date AND pr.end_date;


--Question 5:

SELECT
    TRUNC(o.purchase_date) AS order_date,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN sa.unit_price IS NOT NULL THEN 1 END) AS paid_orders
FROM
    orders o
LEFT JOIN
    sold_articles sa ON o.id_order = sa.id_order
WHERE
    o.purchase_date >= SYSDATE - 14
GROUP BY
    TRUNC(o.purchase_date)
ORDER BY
    order_date;


--Question 6:

SELECT
    p.id_product,
    p.title,
    SUM(sa.quantity_sold) AS sales_during_promotion
FROM
    products p
JOIN
    sold_articles sa ON p.id_product = sa.id_product
JOIN
    promotions pr ON sa.id_product = pr.id_product AND sa.unit_price = pr.promotion_price
GROUP BY
    p.id_product, p.title;


--Question 7:

SELECT
    o.id_order,
    o.purchase_date,
    u.first_name || ' ' || u.last_name AS customer_name,
    SUM(sa.quantity_sold * p.unit_price) AS total_price
FROM
    orders o
JOIN
    users u ON o.id_user = u.id_user
JOIN
    sold_articles sa ON o.id_order = sa.id_order
JOIN
    products p ON sa.id_product = p.id_product
GROUP BY
    o.id_order, o.purchase_date, u.first_name, u.last_name
ORDER BY
    total_price DESC;


