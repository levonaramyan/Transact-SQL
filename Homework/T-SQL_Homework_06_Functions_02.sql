-- Selecting a joined table from multiple tables with given restrictions
CREATE FUNCTION GetUSDSalesAbroad()
RETURNS TABLE AS RETURN
(
	select
		sl.ProductKey,
		prom.EnglishPromotionName,
		prom.StartDate,
		prom.EndDate,
		sl.UnitPrice,
		cur.CurrencyName,
		ter.SalesTerritoryCountry,
		ter.SalesTerritoryRegion
	from  FactInternetSales as sl
	join DimPromotion as prom
		on prom.PromotionKey = sl.PromotionKey
	join DimCurrency as cur
		on cur.CurrencyKey = sl.CurrencyKey
	join DimSalesTerritory as ter
		on ter.SalesTerritoryKey = sl.SalesTerritoryKey
	where cur.CurrencyAlternateKey = 'USD'
		and sl.UnitPrice between 500 and 1500
		and ter.SalesTerritoryCountry not like '%United%'
)
GO
