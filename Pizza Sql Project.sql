-- 1. Retrieve the total number of orders placed
SELECT COUNT(DISTINCT order_id) AS total_orders FROM dbo.orders$

-- 2. Calculate the total revenue generated from pizza sales
SELECT SUM(pizzas$.price * order_details$.quantity) AS total_revenue
FROM order_details$
JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id

-- 3. Identify the highest-priced pizza
SELECT pizza_types$.name, pizzas$.price
FROM pizzas$
JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
ORDER BY pizzas$.price DESC

-- 4. Identify the most common pizza size ordered
SELECT pizzas$.size, COUNT(*) AS order_count
FROM order_details$
JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
GROUP BY pizzas$.size
ORDER BY order_count DESC

-- 5. List the top 5 most ordered pizza types along with their quantities
SELECT pizzas$.pizza_type_id, pizza_types$.name, SUM(order_details$.quantity) AS total_quantity
FROM order_details$
JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
GROUP BY pizzas$.pizza_type_id, pizza_types$.name
ORDER BY total_quantity DESC

-- 6. Find the total quantity of each pizza category ordered
SELECT pizza_types$.category, SUM(order_details$.quantity) AS total_quantity
FROM order_details$
JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
GROUP BY pizza_types$.category;

-- 7. Determine the distribution of orders by hour of the day
SELECT DATEPART(hour, orders$.time) AS hour_of_day, COUNT(*) AS order_count
FROM orders$
GROUP BY DATEPART(hour, orders$.time)
ORDER BY hour_of_day

-- 8. Category-wise distribution of pizzas
SELECT pizza_types$.category, COUNT(DISTINCT pizzas$.pizza_id) AS pizza_count
FROM pizzas$
JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
GROUP BY pizza_types$.category

-- 9. Group orders by date and calculate the average number of pizzas ordered per day
SELECT date, (total_pizzas) AS avg_pizzas_per_day
FROM (
    SELECT orders$.date, SUM(order_details$.quantity)/7 AS total_pizzas
    FROM orders$
    JOIN order_details$ ON orders$.order_id = order_details$.order_id
    GROUP BY orders$.date
) daily_orders
GROUP BY date;

-- 10. Determine the top 3 most ordered pizza types based on revenue
SELECT top(3) pizzas$.pizza_type_id, pizza_types$.name, SUM(order_details$.quantity * pizzas$.price) AS total_revenue
FROM order_details$
JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
GROUP BY pizzas$.pizza_type_id, pizza_types$.name
ORDER BY total_revenue DESC

-- 11. Calculate the percentage contribution of each pizza type to total revenue
SELECT pizzas$.pizza_type_id, pizza_types$.name, SUM(order_details$.quantity * pizzas$.price) as Revenue,
       SUM(order_details$.quantity * pizzas$.price) / (SELECT SUM(order_details$.quantity * pizzas$.price) 
	   FROM order_details$ 
	   JOIN pizzas$ 
	   ON order_details$.pizza_id = pizzas$.pizza_id) * 100 AS revenue_percentage
FROM pizzas$
JOIN order_details$
ON pizzas$.pizza_id = order_details$.pizza_id 
JOIN pizza_types$ 
ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
GROUP BY pizzas$.pizza_type_id, pizza_types$.name
order by revenue_percentage desc

-- 12. Analyze the cumulative revenue generated over time
SELECT date, daily_revenue, SUM(daily_revenue) OVER (ORDER BY date) AS cumulative_revenue
FROM (
    SELECT orders$.date, SUM(order_details$.quantity * pizzas$.price) AS daily_revenue
    FROM order_details$
    JOIN orders$ ON order_details$.order_id = orders$.order_id
    JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
    GROUP BY orders$.date
) revenue_per_day

-- 13. Determine the top 3 most ordered pizza types based on revenue for each pizza category
SELECT category, pizza_type_id, name, total_revenue
FROM (
    SELECT pizza_types$.category, pizzas$.pizza_type_id, pizza_types$.name, SUM(order_details$.quantity * pizzas$.price) AS total_revenue,
           RANK() OVER (PARTITION BY pizza_types$.category ORDER BY SUM(order_details$.quantity * pizzas$.price) DESC) AS rank
    FROM order_details$
    JOIN pizzas$ ON order_details$.pizza_id = pizzas$.pizza_id
    JOIN pizza_types$ ON pizzas$.pizza_type_id = pizza_types$.pizza_type_id
    GROUP BY pizza_types$.category, pizzas$.pizza_type_id, pizza_types$.name
) ranked_pizzas
WHERE rank <= 3