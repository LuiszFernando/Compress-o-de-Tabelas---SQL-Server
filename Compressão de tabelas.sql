--Verificação do uso dos banco --> Procure o DB_MCLASSDBA
sp_helpdb

--Set no banco que vamos ultilizar.
USE DB_MCLASSDBA
GO


exec sp_spaceused SalesOrder
exec sp_spaceused SalesOrderDetail

--Verificação de ganho na tabela SalesOrder
--Compressão por linha 
exec sp_estimate_data_compression_savings 'dbo', 'SalesOrder', null, null, 'ROW'
GO
--Verificação de ganho na tabela SalesOrder
--Compressão por página(PRINCIPALMENTE TABELAS QUE RECEBEM MUITA LEITURA) 
exec sp_estimate_data_compression_savings 'dbo', 'SalesOrder', null, null, 'PAGE'
GO



--Verificação de ganho na tabela SalesOrderDetail
--Compressão por linha 
exec sp_estimate_data_compression_savings 'dbo', 'SalesOrderDetail', null, null, 'ROW'
GO
--Verificação de ganho na tabela SalesOrderDetail
--Compressão por página(PRINCIPALMENTE TABELAS QUE RECEBEM MUITA LEITURA) 
exec sp_estimate_data_compression_savings 'dbo', 'SalesOrderDetail', null, null, 'PAGE'
GO





--Procedure para saber o nome da PK da tabela 
sp_helpindex SalesOrder;
sp_helpindex SalesOrderDetail



--Scripts para fazer a compressão
ALTER INDEX PK_SALESORDER ON SalesOrder REBUILD WITH (DATA_COMPRESSION = PAGE);
ALTER INDEX PK_SalesOrderDetail ON SalesOrderDetail REBUILD WITH (DATA_COMPRESSION = PAGE);





