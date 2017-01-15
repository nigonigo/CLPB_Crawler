library(rvest)
library(stringr)

CPBLCrawleFunc <- function(url,i){
    
  URL <- paste0(url,i)
  
  webHtml <- read_html(URL,encoding = "UTF-8")
    
    CPBL_StatisticalTerms <- webHtml %>% 
      
      html_nodes("th") %>% 
      
      html_text() %>% as.list()
    
    Player_StatisticalValue <- webHtml %>% 
      
      html_nodes("td") %>% 
      
      html_text()
    
    Player_performance <- matrix(Player_StatisticalValue, ncol = 31 , byrow = TRUE) %>% 
      
      as.data.frame(., stringsAsFactors = FALSE) %>% `names<-`(CPBL_StatisticalTerms)
    
  }


finalData <- (data.frame())

url <- "http://www.cpbl.com.tw/stats/all.html?year=0000&stat=pbat&online=0&sort=G&order=desc&per_page=1"

for(i in 1:2){
      
    CPBLCrawleFunc(url,i)
    
    finalData = rbind(finalData,CPBLCrawleFunc(url,i)) 
    
    Sys.sleep(runif(1,2,4))
}

