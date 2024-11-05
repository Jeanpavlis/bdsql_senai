use ContosoRetailDW
--1
select * from DimProduct
select ProductName, ColorName, UnitPrice, UnitCost from DimProduct

create view vwProdutos AS
select ProductName, ColorName, UnitPrice, UnitCost from DimProduct
select * from vwProdutos

drop view dbo.vw_ProductSales

select * from DimEmployee
create view vwFuncionarios AS
select FirstName, BirthDate, DepartmentName from DimEmployee

select * from vwFuncionarios

select * from DimStore
create view vwLojas as
select StoreKey, StoreName, OpenDate from DimStore
select * from vwLojas
--2


select * from DimCustomer
create view vwClientes as
select
	concat(FirstName,+' ',+LastName) as 'NomeCompleto',
		case
			when Gender = 'M' then 'Masculino'
			when Gender = 'F' then 'Feminino'
			else 'Empresa'
		end as "Sexo",		
	EmailAddress,
	YearlyIncome
from DimCustomer
select * from vwClientes
--3
/*A partir da tabela DimStore, crie uma View que considera apenas as
lojas ativas. Faça um SELECT de todas as colunas. Chame essa View
de vwLojasAtivas.*/

create view vwLojasAtivas as
select * from DimStore
where  CloseDate is null

select * from vwLojasAtivas

/*A partir da tabela DimEmployee, crie uma View de uma tabela que
considera apenas os funcionários da área de Marketing. Faça um
SELECT das colunas: FirstName, EmailAddress e DepartmentName.
Chame essa de vwFuncionariosMkt.*/

create view vwFuncionariosMkt as
select FirstName, EmailAddress, DepartmentName from DimEmployee where DepartmentName = 'Marketing'

/*Crie uma View de uma tabela que considera apenas os produtos das
marcas Contoso e Litware. Além disso, a sua View deve considerar
apenas os produtos de cor Silver. Faça um SELECT de todas as
colunas da tabela DimProduct. Chame essa View de vwContosoLitwareSilver*/
create view vwContosoLitwareSilver as
select * from DimProduct where BrandName = 'Litware'
select ProductKey, ProductLabel from vwContosoLitwareSilver

--4
/*Crie uma View que seja o resultado de um agrupamento da tabela
FactSales. Este agrupamento deve considerar o SalesQuantity
(Quantidade Total Vendida) por Nome do Produto. Chame esta View de
vwTotalVendidoProdutos.*/

select * from vwTotalVendidoProdutos
select top(1000)* from factsales

create view vwTotalVendidoProdutos as
select Productkey, sum(SalesQuantity) as Soma from factsales group by Productkey;
select fc.ProductKey, dm.ProductName, sum(SalesQuantity) as Soma from factsales as fc group by fc.Productkey order by 2 inner join DimProduct as dm on fc.ProductKey = dm.ProductKey;

select ProductKey from vwTotalVendidoProdutos

select DimProduct.Productname, sum(SalesQuantity) as Soma from FactSales
inner join DimProduct on FactSales.ProductKey = DimProduct.ProductKey
group by DimProduct.Productname
order by soma desc

--5
/*Faça as seguintes alterações nas tabelas da questão 1.
a.Na View criada na letra a da questão 1, adicione a coluna de
BrandName.*/

alter view vwProdutos AS
select ProductName, BrandName, ColorName, UnitPrice, UnitCost from DimProduct
select * from vwProdutos

/*b.Na View criada na letra b da questão 1, faça um filtro e
considere apenas os funcionários do sexo feminino.*/
select * from DimEmployee
create view vwFuncionarios AS
select FirstName, BirthDate, DepartmentName from DimEmployee

alter view vwFuncionarios AS
select FirstName, BirthDate, DepartmentName from DimEmployee where Gender = 'F'
select * from vwFuncionarios


/*c.Na View criada na letra c da questão 1, faça uma alteração e
filtre apenas as lojas ativas.*/

select * from DimStore
alter view vwLojas as
select StoreKey, StoreName, OpenDate from DimStore where CloseDate is null
select * from vwLojas

--6
/*Crie uma View que seja o resultado de um agrupamento da tabela
DimProduct. O resultado esperado da consulta deverá ser o total de
produtos por marca. Chame essa View de vw_6a.*/

select * from DimProduct
create view vw_6a as
select BrandName, count(*) as Total from DimProduct group by BrandName;
select * from vw_6a order by total desc










/*Altere a View criada no exercício anterior, adicionando o peso total
por marca. Atenção: sua View final deverá ter então 3 colunas: Nome
da Marca, Total de Produtos e Peso Total.*/

/*Exclua a View vw_6a.*/