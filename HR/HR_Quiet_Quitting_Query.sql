USE bytedegree;

RENAME TABLE 데이터분석_Expert TO HR;

COMMIT;

SELECT * FROM HR;

# 요소가 1개밖에 없는 요인들 살펴보는 쿼리
SELECT 
    'over18' AS Column_Name, COUNT(DISTINCT over18) AS Count_Unique, GROUP_CONCAT(DISTINCT CAST(over18 AS CHAR)) AS Unique_Values
FROM HR
UNION ALL
SELECT 
    'StandardHours' AS Column_Name, COUNT(DISTINCT StandardHours) AS Count_Unique, GROUP_CONCAT(DISTINCT CAST(StandardHours AS CHAR)) AS Unique_Values
FROM HR
UNION ALL
SELECT 
    'EmployeeCount' AS Column_Name, COUNT(DISTINCT EmployeeCount) AS Count_Unique, GROUP_CONCAT(DISTINCT CAST(EmployeeCount AS CHAR)) AS Unique_Values
FROM HR;

# 업무성과별 인원 및 비율 살펴보는 쿼리
SELECT PerformanceRating, 
       COUNT(PerformanceRating) AS Count,
       Concat(Round(COUNT(PerformanceRating) * 100.0 / (SELECT COUNT(*) FROM HR), 2), '%') AS Ratio
FROM HR
GROUP BY PerformanceRating;

# 경력기간별 업무 성과별 인원 및 비율 살펴보는 쿼리
SELECT TotalWorkingYears, 
       SUM(CASE WHEN PerformanceRating = 4 THEN 1 ELSE 0 END) AS Rating4Count,
       COUNT(*) AS TotalCount,
       (SUM(CASE WHEN PerformanceRating = 4 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Rating4Percentage
FROM HR
GROUP BY TotalWorkingYears
ORDER BY TotalWorkingYears;

# 마지막 승진 이후 기간별 업무 성과별 인원 및 비율 살펴보는 쿼리
SELECT t.YearsSinceLastPromotion,
       t.PerformanceRating,
       COALESCE(RatingCounts.RatingCount, 0) AS RatingCount,
       ROUND((COALESCE(RatingCounts.RatingCount, 0) / NULLIF(SUM(COALESCE(RatingCounts.RatingCount, 0)) OVER (PARTITION BY t.YearsSinceLastPromotion), 0)) * 100, 2) AS RatingPercentage
FROM (
    SELECT DISTINCT YearsSinceLastPromotion, PerformanceRating
    FROM HR
) t
LEFT JOIN (
    SELECT YearsSinceLastPromotion, PerformanceRating, COUNT(PerformanceRating) AS RatingCount
    FROM HR
    GROUP BY YearsSinceLastPromotion, PerformanceRating
) RatingCounts ON t.YearsSinceLastPromotion = RatingCounts.YearsSinceLastPromotion AND t.PerformanceRating = RatingCounts.PerformanceRating
ORDER BY t.YearsSinceLastPromotion, t.PerformanceRating;

# 업무성과별 초과근무 여부 살펴보는 쿼리 
SELECT PerformanceRating,
       Overtime,
       COUNT(Overtime) AS Count,
       CONCAT(ROUND(COUNT(Overtime) * 100.0 / SUM(COUNT(Overtime)) OVER (PARTITION BY PerformanceRating), 2), '%') AS Ratio
FROM HR
GROUP BY PerformanceRating, Overtime
ORDER BY PerformanceRating, Overtime;

# 연령대별 업무성과별 초과근무 인원 및 비율 살펴보는 쿼리
SELECT 
  AgeGroup,
  PerformanceRating,
  Overtime,
  COUNT(*) AS NumberOfPeople,
  CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY AgeGroup, PerformanceRating), 2), '%') AS RatioByPRAndOvertime
FROM (
  SELECT 
    CASE 
      WHEN age BETWEEN 18 AND 19 THEN '18~19'
      WHEN age BETWEEN 20 AND 29 THEN '20~29'
      WHEN age BETWEEN 30 AND 39 THEN '30~39'
      WHEN age BETWEEN 40 AND 49 THEN '40~49'
      WHEN age BETWEEN 50 AND 59 THEN '50~59'
      WHEN age BETWEEN 60 AND 69 THEN '60~69'
      ELSE 'Others'
    END AS AgeGroup,
    PerformanceRating,
    Overtime
  FROM HR
) AS AgePerformanceOvertime
GROUP BY AgeGroup, PerformanceRating, Overtime
ORDER BY AgeGroup, PerformanceRating, Overtime;

# 부서별 업무성과별 초과근무 인원 및 비율 살펴보는 쿼리 
SELECT
	   Department,
	   PerformanceRating,
       Overtime,
       COUNT(Overtime) AS Count,
       CONCAT(ROUND(COUNT(Overtime) * 100.0 / SUM(COUNT(Overtime)) OVER (PARTITION BY Department, PerformanceRating), 2), '%') AS Ratio
FROM HR
GROUP BY Department, PerformanceRating, Overtime
ORDER BY Department, PerformanceRating, Overtime;

# 스톡옵션레벨 별 업무성과별 초과근무 인원 및 비율 살펴보는 쿼
SELECT
	   StockOptionLevel,
	   PerformanceRating,
       COUNT(Overtime) AS Count,
       CONCAT(ROUND(COUNT(PerformanceRating) * 100.0 / SUM(COUNT(PerformanceRating)) OVER (PARTITION BY StockOptionLevel), 2), '%') AS Ratio
FROM HR
GROUP BY StockOptionLevel, PerformanceRating
ORDER BY StockOptionLevel, PerformanceRating;

# 업무성과별 급여의 증가분 백분율 살펴보는 쿼리
SELECT
	   PerformanceRating,
	   CONCAT(Round(AVG(PercentSalaryHike), 2), '%') AS AvgPercentSalaryHike,
	   Max(PercentSalaryHike),
	   Min(PercentSalaryHike)
FROM HR
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

# 퇴직인원 및 비율 살펴보는 쿼리 
SELECT Attrition,
			Count(Attrition),
			Concat(Round(COUNT(Attrition) * 100.0 / (SELECT COUNT(*) FROM HR), 2), '%') AS Ratio
FROM HR
GROUP BY Attrition;

# 집과 회사의 거리별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT DistanceFromHome,
			Attrition,
			Count(Attrition),
			CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY DistanceFromHome), 2), '%') AS Ratio
FROM HR
GROUP BY DistanceFromHome, Attrition
ORDER BY DistanceFromHome, Attrition;

# 퇴직여부 별 평균,최대,최소 월 소득 살펴보는 쿼리
SELECT Attrition,
             AVG(MonthlyIncome) AS Avg_MonthlyIncome,
		 	 Max(MonthlyIncome),
			 Min(MonthlyIncome)
FROM HR
GROUP BY Attrition;

# 업무환경 만족도별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT EnvironmentSatisfaction,
		     Attrition,
		     Count(Attrition),
		     CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY EnvironmentSatisfaction), 2), '%') AS Ratio
FROM HR
GROUP BY EnvironmentSatisfaction, Attrition
ORDER BY EnvironmentSatisfaction, Attrition;

# 업무성과별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT PerformanceRating ,
		     Attrition,
		     Count(Attrition),
		     CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY PerformanceRating), 2), '%') AS Ratio
FROM HR
GROUP BY PerformanceRating, Attrition
ORDER BY PerformanceRating, Attrition;

# 연령대별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT 
  AgeGroup,
  Attrition,
  COUNT(*) AS NumberOfPeople,
  CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY AgeGroup), 2), '%') AS RatioAttByAgegroup
FROM (
  SELECT 
    CASE 
      WHEN age BETWEEN 18 AND 19 THEN '18~19'
      WHEN age BETWEEN 20 AND 29 THEN '20~29'
      WHEN age BETWEEN 30 AND 39 THEN '30~39'
      WHEN age BETWEEN 40 AND 49 THEN '40~49'
      WHEN age BETWEEN 50 AND 59 THEN '50~59'
      WHEN age BETWEEN 60 AND 69 THEN '60~69'
      ELSE 'Others'
    END AS AgeGroup,
    Attrition
  FROM HR
) AS AgeAtt
GROUP BY AgeGroup, Attrition
ORDER BY AgeGroup, Attrition;

# 마지막 승진 이후 기간별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT YearsSinceLastPromotion,
			 Attrition,
			 Count(Attrition),
			 CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY YearsSinceLastPromotion), 2), '%') AS RatioAttByYSLP
FROM HR
GROUP BY YearsSinceLastPromotion, Attrition
ORDER BY YearsSinceLastPromotion, Attrition;

# 현재 업무 기간별 퇴직 인원 및 비율 살펴보는 쿼리 
SELECT YearsInCurrentRole,
			 Attrition,
			 Count(Attrition),
			 CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY YearsInCurrentRole), 2), '%') AS RatioAttByYSLP
FROM HR
GROUP BY YearsInCurrentRole, Attrition
ORDER BY YearsInCurrentRole, Attrition;

# 연령대별 결혼여부별 업무성과별 퇴직 인원 및 비율 살펴보는 쿼리
SELECT 
  AgeGroup,
  MaritalStatus,
  PerformanceRating,
  Attrition,
  COUNT(*) AS NumberOfPeople,
  CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY AgeGroup, MaritalStatus, PerformanceRating), 2), '%') AS Ratio
FROM (
  SELECT 
    CASE 
      WHEN age BETWEEN 18 AND 19 THEN '18~19'
      WHEN age BETWEEN 20 AND 29 THEN '20~29'
      WHEN age BETWEEN 30 AND 39 THEN '30~39'
      WHEN age BETWEEN 40 AND 49 THEN '40~49'
      WHEN age BETWEEN 50 AND 59 THEN '50~59'
      WHEN age BETWEEN 60 AND 69 THEN '60~69'
      ELSE 'Others'
    END AS AgeGroup,
    MaritalStatus,
    PerformanceRating,
    Attrition
  FROM HR
) AS AgePRMSAttrition
GROUP BY AgeGroup, MaritalStatus, PerformanceRating, Attrition
ORDER BY AgeGroup, MaritalStatus, PerformanceRating, Attrition;

# 집과 회사의 거리별 '조용한 사직' 인원의 월 평균 소득 비교 쿼리
SELECT DistanceFromHome,
       Attrition,
       AVG(MonthlyIncome)
FROM HR
GROUP BY DistanceFromHome, PerformanceRating, Attrition
HAVING PerformanceRating = 3 
ORDER BY DistanceFromHome;

# 업무환경 만족도별 '조용한 사직'  인원의 월 평균 소득 비교 쿼리
SELECT EnvironmentSatisfaction,
       Attrition,
       AVG(MonthlyIncome)
FROM HR
GROUP BY EnvironmentSatisfaction, PerformanceRating, Attrition
HAVING PerformanceRating = 3 AND Attrition = 'No'
ORDER BY EnvironmentSatisfaction;

# 현재까지 근무한 회사 수 별 현재 업무 기간별 '조용한 사직' 인원 수 및 비율 계산 쿼리
SELECT NumCompaniesWorked,
       YearsInCurrentRole,
       PerformanceRating,
       Attrition,
       Count(Attrition),
	   CONCAT(ROUND(COUNT(Attrition) * 100.0 / SUM(COUNT(Attrition)) OVER (PARTITION BY NumCompaniesWorked, YearsInCurrentRole), 2), '%') AS Ratio
FROM HR
GROUP BY NumCompaniesWorked, YearsInCurrentRole, PerformanceRating, Attrition
ORDER BY NumCompaniesWorked, YearsInCurrentRole, PerformanceRating, Attrition;

# 마지막 승진 이후 기간별 '조용한 사직' 인원의 월 소득 계산 쿼리
SELECT YearsSinceLastPromotion,
			 PerformanceRating,
			 Attrition,
			 Avg(MonthlyIncome)
FROM HR
WHERE YearsSinceLastPromotion IN (6, 9, 12, 15)
AND PerformanceRating = 3 
GROUP BY YearsSinceLastPromotion, PerformanceRating, Attrition
ORDER BY YearsSinceLastPromotion, PerformanceRating, Attrition;



