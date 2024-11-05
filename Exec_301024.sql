
-- Criando a base de dados chamada LoopsDB
CREATE DATABASE LoopsDB;
GO

-- Selecionando a base de dados para uso
USE LoopsDB;
GO

-- Criando a tabela Produtos com colunas ProdutoID, Nome, Quantidade e Preco
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY IDENTITY(1,1), -- Chave primária com incremento automático
    Nome VARCHAR(50), -- Nome do produto
    Quantidade INT, -- Quantidade em estoque
    Preco DECIMAL(10, 2) -- Preço do produto
);
GO

-- Inserindo dados de exemplo na tabela Produtos
INSERT INTO Produtos (Nome, Quantidade, Preco)
VALUES
    ('Caderno', 50, 5.00),
    ('Caneta', 100, 1.50),
    ('Mochila', 30, 25.00),
    ('Lapiseira', 75, 3.75);
GO

select * from Produtos


-- Declarando uma variável chamada @contador e iniciando com o valor 1
DECLARE @contador INT = 1;

-- Estrutura de loop: o loop WHILE continua enquanto @contador <= 10
WHILE @contador <= 100
BEGIN
    -- Exibe o valor atual da variável @contador no console
    PRINT 'Contador: ' + CAST(@contador AS VARCHAR);

    -- Incrementa o valor de @contador em 1 para evitar um loop infinito
    SET @contador = @contador + 1;
END;


-- Declarando variáveis para o ID e a quantidade do produto
DECLARE @id INT = 1;
DECLARE @quantidade INT;

-- Loop para aumentar a quantidade de cada produto em 10%
WHILE @id <= (SELECT MAX(ProdutoID) FROM Produtos) -- O loop vai até o último ProdutoID
BEGIN
    -- Busca a quantidade atual do produto com o ID igual a @id
    SET @quantidade = (SELECT Quantidade FROM Produtos WHERE ProdutoID = 1);

    -- Atualiza a quantidade do produto, aumentando em 10%
    UPDATE Produtos
    SET Quantidade = @quantidade * 1.1
    WHERE ProdutoID = @id;

    -- Incrementa o valor de @id para passar ao próximo produto
    SET @id = @id + 1;
END;

declare @contador int;
set @contador = 1;

while @contador <=20
	begin
		print @contador;
		set @contador = @contador + 1;
	end;

/* 2 - Diminuir preços: Usando um loop, diminua o preço de cada produto em 5% e exiba o novo valor para cada produto.*/

select * from Produtos



declare @id int = 1;
while @id <= (SELECT MAX(ProdutoID) FROM Produtos)
	begin
	UPDATE Produtos
		SET Preco = Preco * 1.9
		WHERE ProdutoID = @id;
	set @id = @id + 1;
	end
	select * from Produtos


	update produtos
	set Quantidade = 75
	where produtoID = 4


	 ('Caderno', 50, 5.00),
    ('Caneta', 100, 1.50),
    ('Mochila', 30, 25.00),
    ('Lapiseira', 75, 3.75);
	
/*Inserir dados automaticamente:
Crie um loop para inserir 10 novos produtos na tabela Produtos.
Cada produto deve ter um nome como “Produto X” e uma quantidade inicial de 20.*/


declare @ProdutoID int, @QuantosMais int, @ProdutoId_Inicial int;
set @ProdutoID_Inicial = (select max(produtoid) from Produtos);
set @ProdutoID = (select max(ProdutoID) from Produtos) + 1;
print 'ProdutoID Inicial é: ' + cast(@produtoID as varchar)
print 'ProdutoID Atual é: ' + cast(@produtoID as varchar)

set @QuantosMais = 10
while (select max(ProdutoID) from Produtos) <= @ProdutoId_Inicial + @QuantosMais
begin
	insert into Produtos (nome, quantidade, preco)
	values('ProdutoX', 20, 0.00);
	set @ProdutoID = @ProdutoID + 1;
end
select * from Produtos
go

use ProdutosDB
select * from ProdutosDB

delete from Produtos
where ProdutoId >= 5;

/* Cálculo acumulativo de valor em estoque:
Calcule o valor total em estoque de todos os produtos, multiplicando a Quantidade pelo Preco e somando para cada produto usando um loop.
Exiba o valor total após o loop.*/

select * from LoopsDB

--Exercicios Contoso
/*Utilize o Loop While para criar um contador que comece em um valor
inicial @ValorInicial e termine em um valor final @ValorFinal. Você deverá
printar na tela a seguinte frase:
“O valor do contador é: “ + ___*/

declare @ValorInicial int, @ValorFinal int, @Contador int;
set @ValorInicial = 1
set @ValorFinal = 1000000;
set @Contador = @ValorInicial

while @Contador < @ValorFinal
	begin
		set @Contador = @Contador + 1
	end;
	print '“O valor do contador é: “ +'+ cast(@contador as varchar) + '*/'
	go

/*Você deverá criar uma estrutura de repetição que printe na tela
a quantidade de contratações para cada ano, desde 1996 até 2003. A informação de data de contratação encontra-se na
coluna HireDate da tabela DimEmployee. Utilize o formato:
X contratações em 1996
Y contratações em 1997
Z contratações em 1998
...
N contratações em 2003
Obs. A coluna HireDate contém a data completa (dd/mm/aaa).
Printe a quantidade de contratações por ano.*/

use ContosoRetailDW
select HireDate from DimEmployee

declare @1996 int, @1997 int, @1998 int, @1999 int, @2000 int, @2001 int, @2002 int, @2003 int, @contador int = 1996;

while @contador <= 2003
	begin
	set @1996 = (select count(HireDate) as 'Contratacoes' from DimEmployee where HireDate between '01-01-1996' and '31-12-1996');

	end
print @1996






















	








	

