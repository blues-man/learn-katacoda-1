DROP DATABASE IF EXISTS [SampleDB];
GO

CREATE DATABASE [SampleDB];
GO

USE SampleDB;
GO

SET NOCOUNT ON
GO

WITH a AS (SELECT * FROM (VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10)) AS a(a)) 
SELECT TOP(5000000) ROW_NUMBER() OVER (ORDER BY a.a) AS OrderItemId, 
a.a + b.a + c.a + d.a + e.a + f.a + g.a + h.a AS OrderId,
a.a * 10 AS Price,
CONCAT(a.a, N' ', b.a, N' ', c.a, N' ', d.a, N' ', e.a, N' ', f.a, N' ', g.a, N' ', h.a) AS ProductName
INTO Orders 
FROM a, a AS b, a AS c, a AS d, a AS e, a AS f, a AS g, a AS h; 
GO
                                                                               
CREATE NONCLUSTERED COLUMNSTORE INDEX [columnstoreindex] ON Orders
(
  [Price]
) WITH (DROP_EXISTING = ON, COMPRESSION_DELAY = 0);
GO

DBCC DROPCLEANBUFFERS;
                                                                               
DECLARE @StartingTime datetime2(7) = SYSDATETIME();
                                                                               
SELECT SUM(Price), AVG(Price) FROM Orders;

PRINT 'Using nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';

SET @StartingTime = SYSDATETIME();

SELECT SUM(Price), AVG(Price) FROM Orders 
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);

PRINT 'Without nonclustered columnstore index: ' + CAST(DATEDIFF(millisecond, @StartingTime, SYSDATETIME()) AS varchar(20)) + ' ms';

GO 10
