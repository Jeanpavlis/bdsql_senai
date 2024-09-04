--select *  from * where *
select count(CustomerKey) as 'QtdeMulheres'  from DimCustomer where gender = 'f'
select count(distinct DepartmentName) as 'QtdeArea'  from DimEmployee
select sum(SalesQuantity) as 'TTVendido'  from FactSales
select sum(SalesQuantity) as 'TTVendido'  from FactSales where UnitPrice >= 100
select avg(SalesQuantity) as 'MediaMaior100'  from factsales where UnitPrice >= 100
select min(SalesQuantity) as 'MenorQtde'  from factsales
select max(SalesQuantity) as 'MaiorQtde'  from factsales

/*Questão 1
O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa análise considerando a tabela FactSales.*/
select * from DimStore
select * from DimChannel
select * from FactSales
select sum(SalesQuantity) as 'QtdeVendas', sum(ReturnQuantity) as 'QtdeDev' from FactSales where channelKey = 1

/*Questão 2
Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse resultado.*/
select * from DimCustomer
select avg(YearlyIncome) as 'MediaSal' from DimCustomer

/*Questão 3
Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na empresa. O seu gerente te pediu os seguintes números e informações:
a. Quantos funcionários tem a loja com mais funcionários?*/
select max(EmployeeCount) from DimStore

/*b. Qual é o nome dessa loja?*/
select StoreName, EmployeeCount  from DimStore order by EmployeeCount desc -- 'Contoso NorthAmerica Online Store'

/*c. Quantos funcionários tem a loja com menos funcionários?*/
select min(EmployeeCount) from DimStore --7

/*d. Qual é o nome dessa loja?*/
select * from DimStore
select StoreName, EmployeeCount  from DimStore where CloseDate is not null order by EmployeeCount -- 'Contoso Stoughton Store e Contoso Pittsfild Store'

/*Questão 4
A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade total de funcionários do sexo Masculino e do sexo Feminino.
a. Descubra essas duas informações utilizando o SQL.*/

select * from DimEmployee
select count(gender) from DimEmployee where gender = 'f' -- F=87
select count(gender) from DimEmployee where gender = 'm' -- F=206

/*b. O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.*/
select FirstName, EmailAddress, StartDate from DimEmployee where gender = 'm' order by StartDate -- Kim
select FirstName, EmailAddress, StartDate from DimEmployee where gender = 'f' order by StartDate -- Terry

/*Questão 5
Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes informações:
a. Quantidade distinta de cores de produtos.*/
select count(distinct(ColorName)) from DimProduct -- 16

/*b. Quantidade distinta de marcas*/
select count(distinct(BrandName)) from DimProduct -- 11

/*c. Quantidade distinta de classes de produto Para simplificar, você pode fazer isso em uma mesma consulta.*/

select distinct ClassID from DimProduct
select count(distinct ClassID) from DimProduct -- 3

