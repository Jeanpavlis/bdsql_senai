--select *  from * where *
select count(CustomerKey) as 'QtdeMulheres'  from DimCustomer where gender = 'f'
select count(distinct DepartmentName) as 'QtdeArea'  from DimEmployee
select sum(SalesQuantity) as 'TTVendido'  from FactSales
select sum(SalesQuantity) as 'TTVendido'  from FactSales where UnitPrice >= 100
select avg(SalesQuantity) as 'MediaMaior100'  from factsales where UnitPrice >= 100
select min(SalesQuantity) as 'MenorQtde'  from factsales
select max(SalesQuantity) as 'MaiorQtde'  from factsales

/*Quest�o 1
O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa an�lise considerando a tabela FactSales.*/
select * from DimStore
select * from DimChannel
select * from FactSales
select sum(SalesQuantity) as 'QtdeVendas', sum(ReturnQuantity) as 'QtdeDev' from FactSales where channelKey = 1

/*Quest�o 2
Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse resultado.*/
select * from DimCustomer
select avg(YearlyIncome) as 'MediaSal' from DimCustomer

/*Quest�o 3
Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na empresa. O seu gerente te pediu os seguintes n�meros e informa��es:
a. Quantos funcion�rios tem a loja com mais funcion�rios?*/
select max(EmployeeCount) from DimStore

/*b. Qual � o nome dessa loja?*/
select StoreName, EmployeeCount  from DimStore order by EmployeeCount desc -- 'Contoso NorthAmerica Online Store'

/*c. Quantos funcion�rios tem a loja com menos funcion�rios?*/
select min(EmployeeCount) from DimStore --7

/*d. Qual � o nome dessa loja?*/
select * from DimStore
select StoreName, EmployeeCount  from DimStore where CloseDate is not null order by EmployeeCount -- 'Contoso Stoughton Store e Contoso Pittsfild Store'

/*Quest�o 4
A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade total de funcion�rios do sexo Masculino e do sexo Feminino.
a. Descubra essas duas informa��es utilizando o SQL.*/

select * from DimEmployee
select count(gender) from DimEmployee where gender = 'f' -- F=87
select count(gender) from DimEmployee where gender = 'm' -- F=206

/*b. O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/
select FirstName, EmailAddress, StartDate from DimEmployee where gender = 'm' order by StartDate -- Kim
select FirstName, EmailAddress, StartDate from DimEmployee where gender = 'f' order by StartDate -- Terry

/*Quest�o 5
Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes informa��es:
a. Quantidade distinta de cores de produtos.*/
select count(distinct(ColorName)) from DimProduct -- 16

/*b. Quantidade distinta de marcas*/
select count(distinct(BrandName)) from DimProduct -- 11

/*c. Quantidade distinta de classes de produto Para simplificar, voc� pode fazer isso em uma mesma consulta.*/

select distinct ClassID from DimProduct
select count(distinct ClassID) from DimProduct -- 3

