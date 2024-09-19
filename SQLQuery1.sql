-- Which customers have the highest lifetime value?
select CustomerID, sum(UnitPrice * Quantity) as Total 
from dbo.data$
group by customerID
order by Total desc  

--what is the average number of items per order
select round(avg(Quantity), 0)
from dbo.data$ 

--Which product categories (or product types) generate the most revenue?
select Description, sum(UnitPrice * Quantity) as Total
from dbo.data$
group by Description
order by Total desc 

-- What is the monthly sales trend over time?
 select datepart(month, InvoiceDate) as CalendarMonth, dbo.data$.Description, sum(UnitPrice * Quantity) as Total  
from dbo.data$
group by Description, InvoiceDate
order by CalendarMonth asc

-- What are the top-selling products?
select top 20 Description, sum(Quantity) as Amount
from dbo.data$
group by Description
order by Amount desc

-- Which countries or regions have the highest number of customers?
select top 10 Country, count(distinct CustomerID) as CustomerCount
from dbo.data$
group by Country
order by Customer Desc

-- Are there specific products that sell better in certain countries?
select Country, Description, sum(Quantity) as TotalQuantity
from dbo.data$
where Description is not null and Quantity > 0 and Country = 'Greece'
group by Country, Description
order by TotalQuantity desc