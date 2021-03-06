

################네이버 증권 



###table형태로 들어가있는 것들은 table자체로 받아들일수 있습니다.

###XML패키지를 설치하셔야합니다.

###크롤링 해야할 진짜 주소가 숨겨져 있는 경우도 있고 오른쪽 마우스 클릭이 아예 안되는 경우도 있습니다.

###진짜 주소를 찾기 위해서는 일단은 크롬 기준 ctrl +shit + j 또는 오른쪽 마우스 클릭-> 요소검사로 들어갑니다.

###네이버 증권의 특정 종목안의 시세 페이지에서  ctrl+shift+j를 눌러서 화면 우측에 보이는 Network로 들어갑니다.

###현재는 아무것도 안띄어져있습니다만, 화면 아래쪽의 일별시세 의 2페이지로 넘어가는 순간 쫘르륵 하고 우측화면에 많은것이 생성되는데

###경험상 50~60%의 확률로 진짜 주소는 여기 숨겨져있습니다. 빨간색으로 칠해진 부분이 일별 시세가 들어가 있는 진짜 주소입니다.

###다른 것들의 확장자를 보시면 구분하기 어느정도 수월해집니다. css, gif, js파일등은 아니라고 보시면되고 그외에 것들을 더블 클릭 해보시면서 찾아가면됩니다. 





library(XML)



stock_data<-NULL



for(i  in 1:10){

url<-paste0("http://finance.naver.com/item/sise_day.nhn?code=025620&page=",i) ## 진짜 주소의 페이지 url 설정

b<-readHTMLTable(url,encoding='EUC-kR') ## table 그대로 받아들인 readHTMLTable

b2<-b[[1]] ## list형태라 첫번째 큰방만 출력

b3<-b2[!is.na(b2[,2]),] ## NA값을 제거하기 위해 두번째 칼럼의 NA가 있는 것을 찾아서 NA가 없는 행만 추출

colnames(b3)<-c("날짜","종가","전일비","시가","고가","저가","거래량") ## 칼럼명 설정

stock_data<-rbind(stock_data,b3)

cat("\n",i)

}





