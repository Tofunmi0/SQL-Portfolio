SELECT Make FROM Nigerian_Car_Prices
WHERE Make LIKE 'T%'

SELECT Make FROM Nigerian_Car_Prices 
WHERE Make LIKE '%s'

SELECT Make FROM Nigerian_Car_Prices
WHERE Make LIKE '_____'

SELECT Make,Condition FROM Nigerian_Car_Prices
WHERE Condition LIKE 'Nigerian%'

SELECT SUM(Price) AS Total_Car_Price FROM Nigerian_Car_Prices

SELECT AVG(Mileage) AS Average_Mileage FROM Nigerian_Car_Prices

SELECT MAX(Price) AS Most_Expensive, MIN(Price) AS Cheapest FROM Nigerian_Car_Prices

SELECT COUNT(*) AS Total_Cars FROM Nigerian_Car_Prices

SELECT COUNT(*) AS Cars_Above_2000 FROM Nigerian_Car_Prices WHERE Engine_Size > 2000

SELECT Make, COUNT(Make) AS Car_No
FROM Nigerian_Car_Prices
GROUP BY Make

SELECT Make, AVG(Price) AS Average_Price
FROM Nigerian_Car_Prices
GROUP BY Make

SELECT Make,Condition, MAX(Price) AS Highest_Price
FROM Nigerian_Car_Prices
GROUP BY Condition,Make
Order by Condition desc,Highest_Price desc

SELECT Transmission, COUNT(Transmission) AS Transmission_Count
FROM Nigerian_Car_Prices
GROUP BY Transmission

SELECT Make,Price FROM Nigerian_Car_Prices 
WHERE Price BETWEEN 2000000 AND 5000000

SELECT Make,Year_of_manufacture FROM Nigerian_Car_Prices
WHERE Year_of_manufacture BETWEEN 2005 AND 2015

SELECT Make,Mileage FROM Nigerian_Car_Prices
WHERE Mileage BETWEEN 50000 AND 150000

SELECT Make,Year_of_manufacture FROM Nigerian_Car_Prices
WHERE Year_of_manufacture IS NULL

SELECT Make,Build FROM Nigerian_Car_Prices
WHERE Build IS NOT NULL

SELECT * FROM Nigerian_Car_Prices
WHERE Make IN ('Toyota', 'Lexus', 'Mercedes-Benz')

SELECT * FROM Nigerian_Car_Prices
WHERE Condition IN ('Nigerian Used', 'Foreign Used')

SELECT * FROM Nigerian_Car_Prices
WHERE Year_of_manufacture = 2010 OR Transmission = 'Automatic'

SELECT * FROM Nigerian_Car_Prices
WHERE Price < 2000000 OR Mileage > 200000



