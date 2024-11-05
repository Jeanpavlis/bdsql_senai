use ContosoRetailDW

select avg(UnitPrice) as X from DimProduct
select * from DimProduct where UnitPrice > (select avg(UnitPrice) as X from DimProduct)

select * from DimProduct where UnitPrice > (select * from Media)
create view Media as

select * from DimProduct
select distinct(ProductSubcategoryKey) from DimProduct order by 1

select * from DimProductSubcategory

select ProductName from DimProduct where ProductSubcategoryKey = (select ProductSubcategoryKey from DimProductSubcategory where ProductSubcategoryName = 'Televisions')

/*Faça uma consulta para descobrir os seguintes indicadores dos seus produtos:
Maior quantidade de produtos por marca
Menor quantidade de produtos por marca
Média de produtos por marca*/

use ContosoRetailDW

	with cte_teste as(
	select BrandName, count(BrandName) as 'Total' from DimProduct
	group by BrandName
	)