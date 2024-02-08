# FastCampus Data Analytics Project

## About  
패스트캠퍼스 바이트디그리에서 진행했던 데이터 분석 관련 프로젝트들입니다. 크게는 직무・산업별로 HR, Manufacture(Anomaly Detection), E-Commerce로 구분해서 프로젝트를 진행했으며, 최종 프로젝트는 실제 패스트캠퍼스 기업 데이터를 분석하여 인사이트를 도출하였습니다. 폴더도 프로젝트에 맞게 HR, Manufacture, E-Commerce 그리고 Final Project로 구분하였습니다.

## Projects

### ① HR - 조용한 사직 원인 파악 및 해결방안 제언
![조용한 사직](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/8bb42451-a512-42ee-843b-db2065a79a0d)
  
    
**목적** : '조용한 사직' 인원의 현황 파악, 원인 파악 및 해결방안 제언

원래 HR 프로젝트의 목적은  
1. 업무 성과에 영향을 주는 요인 파악
2. 퇴직 요인 파악  
이었지만, 저는 거기에 추가하여 코로나가 유행할 때 HR 분야에서 화제가 되었던 '조용한 사직'이라는 현상이 프로젝트 데이터에 있을지를 분석해보고 싶었습니다.
분석을 하면서 블로그에도 관련 내용을 올렸으며, 지속적으로 올릴 예정입니다.

블로그 글 ① : [조용한 사직을 어떻게 정의할 수 있을까?](https://hoon-bari.github.io/DA/QuietQuitting)

**스킬** : Data Cleaning, Data Analysis, Hypothesis Testing, Data Visualization

**사용 기술** : SQL, Tableau, PPT

**결과** : '조용한 사직'의 발생원인 분석 및 그를 통한 해결방안 제언

**피드백**
- 조용한 퇴직의 기준을 '퇴직을 안하고 성과가 안좋은 사람'을 의도적으로 정하고 분석하는 것이 아닌지?
- 불릿 포인트 등의 사용으로 "내용과 의견"을 짧게 남기는 편이 더 좋을 듯 합니다.
- "데이터가 ~의 형태여서, 이런 가설을 정했고 분석해보니 이런 결과가 나왔다"의 스토리라인으로 짜면 더욱 완성도 있는 보고서가 될 듯합니다.
- 조용한 사직으로 인해 나타나는 주요 문제는 "조직의 생산성 하락"이므로, "조직의 생산성 하락"을 문제로 삼고 그 원인을 몇몇 가설을 정해서 분석해보면 더 데이터 분석 프로세스에 적합할 것이라 생각합니다.

**보완할 점**
- "조직의 생산성 하락"을 문제로 삼고 다시 한번 가설을 설정해서 데이터를 분석해보기.
- 퇴직 분석에 대한 태블로 대시보드 만들어보기

<br>

### ② 제조 - 반도체 웨이퍼 이상탐지 프로젝트

![하이닉스](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/b7a36dce-8737-4131-b03d-976ec95ef3a9)
<p align="center">
  출처 : <a href="https://news.skhynix.co.kr/post/yesterday-in-the-data-science-organization">SK 하이닉스 뉴스룸</a>
</p>
  
  
**목적**
1. 센서 데이터로부터 불량 웨이퍼 패턴 식별을 위한 이상탐지 모델 개발
2. 데이터의 전처리를 통해 노이즈와 불필요한 정보를 제거하여 분석 효율성 향상
3. 공정 센서의 다변량 데이터 분석을 통한 결함 원인 파악

해당 프로젝트에서는 과제요건서를 체계적으로 작성 후에 데이터 분석을 진행하였습니다.
  
![웨이퍼 이상탐지 과제요건서](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/fbce2f01-7d10-41cf-8ef9-23d843015bf8)
  
  
**스킬** : Data Cleaning, Data Analysis, Data Visualization, Anomaly Detection Modeling

**사용 기술** : Python, Sklearn, Pyod, Matplotlib, Seaborn

**결과**
  
![결과](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/a9de7dc7-dcaa-469e-9270-67f28e570776)

  
**피드백**
- PCA + 마할라노비스 이상탐지의 경우 변수들이 서로 선형독립이라면 유클리드 거리를 이용하는 것과 동일한 개념이 됩니다. 그리고 선형독립이면 마할라노비스를 사용하는 것은 아니긴 하지만 마할라노비스 자체는 유의미한 방법으로 현업에서 많이 활용되고 있습니다.
- Feature IMP는 현재 현업에서 많이 활용하지 않고 경향성 정도만 보고있습니다. 같이 사용하신 SHAP Values나 Permutaion IMP를 사용하시는걸 추천드립니다. 특히 Permutaion IMP는 모델이 달라도 모두 적용할 수 있기 때문에 모델마다 중요도를 동일선상에서 비교할 수 있는 강점이 있습니다.

**보완할 점**
- Permutaion IMP를 사용해서 모델별 성능 비교 다시 해보기
- 다른 웨이퍼 데이터 찾아보고 클러스터링 분석, 분류 분석, 예측 분석 등 해보고 블로그에 관련 글 올려보기
- 이상탐지 데이터에 대해 태블로 대시보드 만들어보기

<br>

### ③ 커머스 - 가상의 홈쇼핑 '다잇다'의 A-Z까지 분석해보기

![다잇다](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/5aa9ac76-7ad7-4dad-bb8b-e3c081e86107)

**목적** : 가상의 홈쇼핑 '다잇다'의 매출 성장 방안, 구매활동성 증대 방안, 세그먼트/개인별 아이템 추천 등 다각도 분석

이 프로젝트에서는 가상의 홈쇼핑 '다잇다'의 데이터 분석가로서, 상사/타 팀원에게 분석을 요청받았다고 생각하며 진행했습니다.  
이 프로젝트 전 기본 프로젝트에서 진행했던 사항을 확장했다고 생각하시면 될 듯합니다.
  
![mail](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/6db41b4e-294c-48b1-9bf8-21c6bd8b4002)

**스킬** : Data Cleaning, Data Analysis, Data Visualization, RFM Analysis, Cohort Analysis, Recommendation System

**사용 기술** : Python, Sklearn, Pandas, Matplotlib, Seaborn, Plotly

**결과**  
'다잇다' 홈쇼핑의 상위 20% 매출 분기별 분석 및 RFM 분석, 코호트 분석을 통한 유저 세그먼트 및 인사이트를 도출하였습니다.  
그리고 해당 분석에 대한 내용을 블로그 글로 게재하고 있습니다.(블로그에는 피드백 받은 사항을 수정하여 올리고 있습니다.)  

블로그 글 ① : [‘다잇다’ 시리즈 ① : 파레토 차트를 통해 ‘다잇다’ 홈쇼핑의 매출 성장 방안 인사이트 도출하기](https://hoon-bari.github.io/DA/Daitda_1)  
블로그 글 ② : [‘다잇다’ 시리즈 ② : ‘다잇다’ 홈쇼핑의 고객 관점에서 구매활동성 증대 방안 분석하기](https://hoon-bari.github.io/DA/Daitda_2)

**피드백**
- 고객의 서비스 이용기간에 따라 장기 고객을 구분하여 접근한 방법이 매우 좋았습니다. 커머스 도메인의 경우 상대적으로 지출이 많거나, 구매 빈도가 높은 고객을 주요 고객으로 바라보는 편입니다. 다만 장기적 관점에서 서비스의 지속 성장을 위해서는 지속적으로 서비스를 이용하는 장기 고객도 중요하다고 할 수 있습니다.
- 실제 실무에서의 체리피커 고객은 활동성이 떨어지는 고객이라기보다는 LTV가 낮고, 특정 이벤트 혹은 해당 서비스를 장기 이용할 목적이 아닌 특정 목적으로 유입된 고객을 말합니다. 서비스 입장에서는 이러한 고객은 수익성이 좋지 않기 때문에 이러한 고객이 지속적으로 유입되는 상황이라면 현재 서비스에서 운영되고 있는 마케팅, 이벤트 등을 다시 점검할 필요가 있습니다. 혹시라도 위와 같은 형태의 분석 과제 전형을 수행하신다면 0~1년차 고객 중 일부 고객을 체리피커 고객이라고 표현하기 보다는 발견된 특성 그대로 구분하여 표현(단기 이용 고객)해주시는게 좋습니다.
- 아이템 추천을 위해 협업필터링을 적용해주신 부분도 좋았지만, 해당 데이터의 경우 희소 행렬이 크게 형성되어 시간이 오래 걸릴 수 있으므로 PCA나 행렬분해(Matrix Factorization), 최근접 이웃 등을 적용하여 데이터의 Sparcity를 줄이는 부분이 필요합니다.
- RFM 분석의 경우 R, F, M 각 구간이 변별력을 가지는 것이 중요합니다. 각 구간의 그룹이 유의미성을 가질 수 있는지 분석 전에 체크하시는 것이 필요합니다.

**보완할 점**
- 피드백을 바탕으로 아이템 추천(Association Rule, Collaborative Filltering) 다시 적용해보고 블로그 글 작성
- '다잇다' 데이터에 대해 커머스 대시보드를 태블로로 만들어보고 관련 글 작성
- 같은 내용을 SQL, R을 가지고 다시 해보고 그 내용을 블로그 글을 통해 정리

<br>

### ④ Final Project - 패스트캠퍼스 기업 데이터 분석

**목적** : 패스트캠퍼스의 customer, course, order, refund 데이터를 통해 패스트캠퍼스 비즈니스에 도움이 될 수 있는 인사이트 도출

해당 프로젝트에서는 SQL, Python, Tableau 등을 모두 이용해 데이터를 분석하였으며, 추가적으로 RFM 분석 등 적용으로 유저 세그먼트를 통해 마케팅에 도움이 될만한 인사이트를 발견하려 했습니다.  
데이터는 customer를 제외하곤 2022년 1월의 데이터로 이루어져있어, 1월의 매출 분석을 통한 인사이트를 주로 도출했습니다.  

**스킬** : Data Cleaning, Data Analysis, Data Visualization, RFM Analysis

**사용 기술** : SQL, Python, Matplotlib, Seaborn, Plotly, Tableau

**결과**
- SQL : 각 데이터의 조인 및 윈도우 함수를 통해 날짜별 매출 확인 / Lead, Lag를 통해 전, 후일 매출 차이 분석
- Tableau : Metric Hierarchy 대시보드 및 User Event Analytics 대시보드 작성, 대시보드 통한 인사이트 도출
  - Metric Hierarchy Dashboard([링크](https://public.tableau.com/app/profile/seunghoon.choi/viz/FastcampusMetricHierarchyDashboard/1)) : 본격적인 분석 전 패스트캠퍼스의 매출 관련 Metric이 주별로 어떻게 변화하는지 관찰하기 위해 작성.
      
    ![Metric Hierarchy](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/fe856f0b-fbf7-4f23-a6b9-d4a3a8203bec)  
    
  - User Event Analytics Dashboard([링크](https://public.tableau.com/app/profile/seunghoon.choi/viz/FastcampusUserEventAnalyticsChartDashboard/ChartDashboard#1)) : 유저의 가입, 장바구니 등록 및 Drop, 구매, 환불까지 일별, 주별, 월별, 기간별로 구분하여 라인, 바, 영역차트로 보고자 하였음. 스타일은 Amplitude와 비슷하게 만듬. 카테고리는 원래 데이터에 없었으므로 현재 패스트캠퍼스가 나누고 있는 대분류 카테고리를 참고하여 구성.  

    ![User Event Analytics Chart](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/25c8d9a6-2c22-4dc0-abc3-7faee6255067)

- python : 데이터 EDA를 통한 인사이트 도출

![결론_1](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/3eec2f92-4628-41c0-92db-d5b04157c0e3)  

![결론_2](https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/9d73a92a-04a1-4402-a803-5d23b3e2cc0e)
  
**피드백** : 작성 예정

**보완할 점**
- Metric Hierarchy에 주문 취소율, 완료율, 계류율 추가
- customer에 있는 가입년도 이용, 신규회원과 기존회원 구분하여 두 집단의 주문 수 및 매출 차이 비교(대시보드에 내용 추가)
- Hibernated 회원의 특성 파악
- 현재 카테고리는 대분류만 했으나, 세부적인 카테고리가 있으면 더 좋았을 것
- 이벤트 여부 확인을 위한 Promotion 데이터가 있었다면 더 자세한 분석이 가능했을 것
