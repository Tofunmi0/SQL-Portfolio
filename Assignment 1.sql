--1
SELECT * FROM dbo.Nigerian_Car_Prices

--2
SELECT Make, Year_of_manufacture, Price
FROM dbo.Nigerian_Car_Prices

--3
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Make = 'Toyota'

--4
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Year_of_manufacture = 2008

--5
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Condition = 'Nigerian Used'

--6
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Transmission = 'Automatic' AND Fuel = 'Petrol'

--7
SELECT * FROM dbo.Nigerian_Car_Prices 
WHERE Make = 'Toyota' AND Year_of_manufacture = 2007 AND Condition = 'Nigerian Used'

--8
SELECT Make AS Car_Brand, Price AS Car_Price
FROM dbo.Nigerian_Car_Prices

--9
SELECT Mileage AS Distance_Travelled
FROM dbo.Nigerian_Car_Prices

--10
SELECT Make, Price, Mileage, (Price / Mileage) AS Price_Per_KM
FROM dbo.Nigerian_Car_Prices

--11
SELECT make FROM dbo.Nigerian_Car_Prices
ORDER BY Price DESC

--12
SELECT * FROM dbo.Nigerian_Car_Prices
ORDER BY Price DESC

--13
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Make = 'Toyota'
ORDER BY Mileage DESC

--14
SELECT * FROM dbo.Nigerian_Car_Prices
WHERE Condition = 'Nigerian Used'
ORDER BY Year_of_manufacture ASC, Price DESC


SELECT Make, Year_of_manufacture, Price 
FROM Nigerian_Car_Prices 
WHERE (Make = 'Lexus' OR Make = 'Toyota') AND Price > 7000000