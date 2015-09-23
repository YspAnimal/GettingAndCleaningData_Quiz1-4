
library(httr) 
library(httpuv)
library(base64enc)
library(jsonlite)

# 1. Find OAuth settings for github: 
#    http://developer.github.com/v3/oauth/ 
oauth_endpoints("github") 
 
# 2. To make your own application, register at at 
#    https://github.com/settings/applications. Use any URL for the homepage URL 
#    (http://github.com is fine) and  http://localhost:1410 as the callback url 
# 
#    Replace your key and secret below. 
myapp <- oauth_app("R", 
  key = "045861995b1c4757e7a8", 
  secret = "fd6b9f3605d66513a23080a1ecd8721da97c3dfa") 
 
# 3. Get OAuth credentials 
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = FALSE)

# 4. Use API 
gtoken <- config(token = github_token) 
req <- GET("https://api.github.com/users/jtleek/repos", token = "74d924291fc15a8122e329bcfdb9dc33c158f205") 
stop_for_status(req) 
content(req) 
result <- fromJSON("https://api.github.com/users/jtleek/repos")
names(result)




# OR: 
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos")) 
stop_for_status(req) 
content(req) 
