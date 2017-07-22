
library(httr)
library(httpuv)
require(jsonlite)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "12ed5bd284246fce4706",
                   secret = "c9eab3b74beb6c540b408c2abb1055bab8b69742")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
output <- content(req)
jsondata <- fromJSON(toJSON(output))
subset(jsondata, name == "datasharing", select = c(created_at))
