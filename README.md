# FastCampus Data Analytics Project

## About  
패스트캠퍼스 바이트디그리에서 진행했던 데이터 분석 관련 프로젝트들입니다. 크게는 직무・산업별로 HR, Manufacture(Anomaly Detection), E-Commerce로 구분해서 프로젝트를 진행했으며, 최종 프로젝트는 실제 패스트캠퍼스 기업 데이터를 분석하여 인사이트를 도출하였습니다. 폴더도 프로젝트에 맞게 HR, Manufacture, E-Commerce 그리고 Final Project로 구분하였습니다.

## Projects

### ① HR - 조용한 사직 원인 파악 및 해결방안 제언
<img width="1142" alt="스크린샷 2024-02-08 오후 1 24 05(2)" src="https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/8bb42451-a512-42ee-843b-db2065a79a0d">
  
    
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
  
<img width="1300" alt="웨이퍼 이상탐지 과제요건서" src="https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/fbce2f01-7d10-41cf-8ef9-23d843015bf8">
  
  
**스킬** : Data Cleaning, Data Analysis, Data Visualization, Anomaly Detection Modeling

**사용 기술** : Python, Sklearn, Pyod

**결과**
  
<img width="1300" alt="결과" src="https://github.com/hoon-bari/FastCampus-Data-Analytics-Project/assets/121400054/a9de7dc7-dcaa-469e-9270-67f28e570776">

  
**피드백**
- PCA + 마할라노비스 이상탐지의 경우 변수들이 서로 선형독립이라면 유클리드 거리를 이용하는 것과 동일한 개념이 됩니다. 그리고 선형독립이면 마할라노비스를 사용하는 것은 아니긴 하지만 마할라노비스 자체는 유의미한 방법으로 현업에서 많이 활용되고 있습니다.
- Feature IMP는 현재 현업에서 많이 활용하지 않고 경향성 정도만 보고있습니다. 같이 사용하신 SHAP Values나 Permutaion IMP를 사용하시는걸 추천드립니다. 특히 Permutaion IMP는 모델이 달라도 모두 적용할 수 있기 때문에 모델마다 중요도를 동일선상에서 비교할 수 있는 강점이 있습니다.

**보완할 점**
- Permutaion IMP를 사용해서 모델별 성능 비교 다시 해보기
- 다른 웨이퍼 데이터 찾아보고 클러스터링 분석, 분류 분석, 예측 분석 등 해보고 블로그에 관련 글 올려보기

<br>



