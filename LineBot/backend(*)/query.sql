-- SQL query for creating view

CREATE VIEW vw_all_events AS
SELECT
    "EventName" AS "EventName",
    "EventTime" AS "EventTime",
    "Venue" AS "Venue",
    "Address" AS "Address",
    "ImageURL" AS "ImageURL",
    "PageURL" AS "PageURL",
    "StartTime" AS "StartTime",
    "EndTime" AS "EndTime"
FROM tb_kktix

UNION ALL

SELECT
    "EventName" AS "EventName",
    "EventTime" AS "EventTime",
    "Venue" AS "Venue",
    "Address" AS "Address",
    "ImageURL" AS "ImageURL",
    "PageURL" AS "PageURL",
    "StartTime" AS "StartTime",
    "EndTime" AS "EndTime"
FROM tb_accupass

UNION ALL

SELECT
    "EventName" AS "EventName",
    "EventTime" AS "EventTime",
    "Venue" AS "Venue",
    "Address" AS "Address",
    "ImageURL" AS "ImageURL",
    "PageURL" AS "PageURL",
    "StartTime" AS "StartTime",
    "EndTime" AS "EndTime"
FROM tb_tixcraft

UNION ALL

SELECT
    "EventName" AS "EventName",
    "EventTime" AS "EventTime",
    "Venue" AS "Venue",
    "Address" AS "Address",
    "ImageURL" AS "ImageURL",
    "PageURL" AS "PageURL",
    "StartTime" AS "StartTime",
    "EndTime" AS "EndTime"
FROM tb_indievox;


-- SQL for alter data type 每個table都要換
ALTER TABLE tb_accupass
ALTER COLUMN "StartTime"
SET DATA TYPE DATE[]
USING ARRAY["StartTime"::DATE];

ALTER TABLE tb_accupass
ALTER COLUMN "EndTime"
SET DATA TYPE DATE[]
USING ARRAY["EndTime"::DATE];

ALTER TABLE tb_kktix
ALTER COLUMN "StartTime"
SET DATA TYPE DATE[]
USING ARRAY["StartTime"::DATE];

ALTER TABLE tb_kktix
ALTER COLUMN "EndTime"
SET DATA TYPE DATE[]
USING ARRAY["EndTime"::DATE];

ALTER TABLE tb_indievox
ALTER COLUMN "StartTime"
SET DATA TYPE DATE[]
USING ARRAY["StartTime"::DATE];

ALTER TABLE tb_indievox
ALTER COLUMN "EndTime"
SET DATA TYPE DATE[]
USING ARRAY["EndTime"::DATE];

ALTER TABLE tb_tixcraft
ALTER COLUMN "StartTime"
SET DATA TYPE DATE[]
USING ARRAY["StartTime"::DATE];

ALTER TABLE tb_tixcraft
ALTER COLUMN "EndTime"
SET DATA TYPE DATE[]
USING ARRAY["EndTime"::DATE];


-- to insert array dates
UPDATE tb_accupass
SET "StartTime" = ARRAY['2024-07-18'::DATE, '2024-09-19'::DATE, '2024-11-21'::DATE],
    "EndTime" = ARRAY['2024-07-18'::DATE, '2024-09-19'::DATE, '2024-11-21'::DATE]
WHERE "EventName" = '【爵士演出】2024 臺灣有拉丁：金秋大樂隊Ｘ享象駐館計畫  Golden Autumn Big Band';


UPDATE tb_accupass
SET "StartTime" = ARRAY['2024-05-18'::DATE, '2024-09-28'::DATE, '2024-11-30'::DATE],
    "EndTime" = ARRAY['2024-05-18'::DATE, '2024-09-28'::DATE, '2024-11-30'::DATE]
WHERE "EventName" = '【爵士演出】郭馬克新復古爵士重奏之爵士新享象';


UPDATE tb_accupass
SET "StartTime" = ARRAY['2024-08-24'::DATE, '2024-09-14'::DATE, '2024-11-15'::DATE, '2024-12-13'::DATE],
    "EndTime" = ARRAY['2024-08-24'::DATE, '2024-09-14'::DATE, '2024-11-15'::DATE, '2024-12-13'::DATE]
WHERE "EventName" = '**實體/線上**顏華容 2024大人的白晝沙龍音樂會 "室內樂與協奏曲"';

UPDATE tb_accupass
SET "StartTime" = ARRAY['2024-07-28'::DATE, '2024-08-11'::DATE, '2024-09-29'::DATE],
    "EndTime" = ARRAY['2024-07-28'::DATE, '2024-08-11'::DATE, '2024-09-29'::DATE]
WHERE "EventName" = '2024 享象【秋季 • 爵士親子派對】 ​​2024 JAZZ FOR KIDS ╳ AUTUMN';

UPDATE tb_accupass
SET "StartTime" = ARRAY['2024-07-20'::DATE, '2024-07-27'::DATE],
    "EndTime" = ARRAY['2024-07-20'::DATE, '2024-07-27'::DATE]
WHERE "EventName" = 'THERMOS膳魔師－120週年紀念特展＿音樂會';



-- to insert array dates
UPDATE public.tb_indievox
SET "StartTime" = ARRAY['2024-11-17'::DATE, '2024-11-18'::DATE, '2024-11-28'::DATE, '2024-11-29'::DATE, '2024-12-05'::DATE, '2024-12-06'::DATE],
    "EndTime" = ARRAY['2024-11-17'::DATE, '2024-11-18'::DATE, '2024-11-28'::DATE, '2024-11-29'::DATE, '2024-12-05'::DATE, '2024-12-06'::DATE]
WHERE "PageURL" = 'https://www.indievox.com/activity/detail/24_iv02984f2'


-- to delete certain row
DELETE FROM public.tb_indievox WHERE "EventName"='test';
