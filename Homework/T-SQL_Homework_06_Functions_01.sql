-- Simple function, which selects necessary columns from two tables
CREATE FUNCTION GetInternetSalesInfo()
RETURNS TABLE AS RETURN
(
	select
		pr.ProductKey,
		ModelName,
		pr.DealerPrice,
		sl.OrderDate,
		sl.TotalProductCost
	from  FactInternetSales as sl
	join DimProduct as pr
	on pr.ProductKey = sl.ProductKey
)
GO
