-- DDL 資料庫 定義 語言

-- 創建 資料庫 C
CREATE DATABASE 資料庫名稱;

-- 刪除 資料庫 D
DROP DATABASE 資料庫名稱;

--------

-- 創建 資料表 C
CREATE TABLE 資料表名稱 (欄位名稱 資料型態)

-- 增加 資料表 欄位 U
ALTER TABLE 資料表名稱
ADD COLUMN 欄位名稱 資料型態;

-- 減少 資料表 欄位 U
ALTER TABLE 資料表名稱
DROP COLUMN 欄位名稱 資料型態;

-- 刪除 資料表 D
DROP TABLE 資料表名稱;

-- DML資料庫 操作 語言

-- C創建資料
INSERT INTO 資料表名稱
(欄位)
VALUES
(值);

-- U更新資料
UPDATE 資料表名稱
SET 要變動的欄位=要變成的值
WHERE 要變動的資料

-- D刪除資料
DELETE FROM 資料表名稱
WHERE 要刪除的資料

-- DQL 資料庫 查詢 語言

-- R讀取資料
SELECT 欄位
FROM 資料表名稱
WHERE 條件;

-- 聚合函數
SELECT 聚合函數（COUNT(*)、SUM(要加總的欄位)、AVG（要平均的欄位）、MAX（想找哪個欄位的最大值））
FROM 資料表名稱
WHERE 條件;

-- 分組
SELECT 欄位, 聚合函數
FROM 資料表名稱
GROUP BY 欄位; # 分組的依據（也要出現在SELECT要顯示的欄位中）
# 聚合函數針對每組計算 分幾組就幾個聚合函數的結果

-- having
-- GRUOP BY 版的 WHERE 搭聚合函數
SELECT 欄位, SUM(Price)
FROM 資料表名稱
GROUP BY 欄位 # 分組的依據（也要出現在SELECT要顯示的欄位中）
HAVING SUM(Price)<1000; # 篩出要出現的組別

-- 不重複欄位
SELECT DISTINCT 欄位 # 列出不重複的欄位名稱
FROM 資料表名稱;

-- 排序
SELECT *
FROM 資料表名稱
WHERE 篩選條件
ORDER BY 欄位; # 按哪個欄位的值 替資料排序 可接 DESC ASC（預設）

-- 只取幾筆
SELECT *
FROM 資料表名稱
WHERE 篩選條件
ORDER BY 欄位
LIMIT 要取幾筆資料;

-- 子查詢
SELECT *
FROM A表
WHERE 欄位 = 
(
  SELECT id
  FROM B表
  WHERE 篩選條件
)

-- 交集 橫向合併表格
-- inner join
SELECT *
FROM A表,B表
WHERE A表.某欄位 = B表.某欄位

SELECT *
FROM A表 INNER JOIN B表
ON A表.某欄位 = B表.某欄位

-- left join
SELECT A表.某欄位, B表.某欄位
FROM A表 LEFT JOIN B表
ON A表.某欄位 = B表.某欄位
WHERE 篩選條件;

-- right join
SELECT A表別名.某欄位, B表別名.某欄位
FROM A表 A表別名 RIGHT JOIN B表 B表別名
ON A表別名.某欄位 = B表別名.某欄位
WHERE 篩選條件;

-- 交集 垂直合併表格
-- union
-- UNION 運算子用來將兩個(以上) SQL 查詢的結果合併起來，而由 UNION 查詢中各別 SQL 語句所產生的 欄位 需要是 相同的資料型別 及 順序。
-- UNION 查詢 只會返回不同值的資料列，有如 SELECT DISTINCT。
-- UNION 就是像是 OR (聯集)，如果紀錄存在於第一個查詢結果集或第二個查詢結果集中，就會被取出。
-- UNION 與 JOIN 不同的地方在於，JOIN 是作橫向結合 (合併多個資料表的各欄位)；而 UNION 則是作垂直結合 (合併多個資料表中的紀錄)。
SELECT column_name(s) FROM A表
UNION
SELECT column_name(s) FROM B表;
-- UNION 查詢返回的 資料集 欄位名稱，通常會依據 第一個 SELECT 查詢的欄位名稱。

-- union all
-- UNION ALL 會列出所有的資料，不論是否重複。
SELECT P_Name FROM products_taiwan
UNION ALL
SELECT P_Name FROM products_china;