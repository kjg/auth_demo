# Authentication and Data Integrity Using api-auth #

## Bio ##

Kevin Glowacz will talk about authentication and data integrity with regards to ruby applications. He will discuss a few different authentication methods and how they compare. He will then go a little more in depth into how the api-auth gem handles authentication and ensures data integrity between client and server.

Kevin Glowacz is a Sr. Software Engineer at Enova on the platform infrastructure team.

@kevinglowacz

Enova is a leading provider of online financial services powered by cutting edge technologies and analytics. Enova uses its proprietary technology, analytics and customer service capabilities to quickly evaluate, underwrite and fund loans in order to offer customers credit when and how they want it. Headquartered in Chicago, Enova has more than 1,100 employees serving its online customers across the globe.



## Background ##
- Authentication
  - (proving you are who you say you are)
- Data Integrity
  - Making sure the data you sent is the data that was received
  - HMAC (keyed-hash message authentication code)

## My Setup

- Chrome
- Foxy Proxy
  - Fine grained controls over what to send to the proxy
  - https://getfoxyproxy.org
  - [Chrome Extension](https://chrome.google.com/webstore/detail/foxyproxy-standard/gcknhkkoolaabfmlnjonogaaifnjlfnp?hl=en)
  - [Firefox Add-On](https://addons.mozilla.org/en-us/firefox/addon/foxyproxy-standard/)
- Burp Suite
  - http://portswigger.net/burp/ (not https?)
  - Platform for performing security testing of web applications
  - I'm using its proxy to view and modify requests

## Demo ##

### Basic Auth ###

- base64 encoded

### digest auth
- Doesn't send raw password
- Can prevent replay attacks

### api auth
- HMAC (data integrity)
- Future improvements: only one way data integrity right now
- none / cnone to futher prevent replay attacks


RestClient.proxy = "http://localhost:8080"
request = RestClient::Request.new(url: "http://auth_demo.dev/api/api_auth/comments/1", method: :put, headers: {content_type: :json}, payload: {body: "Hello world"}.to_json)
ApiAuth.sign!(request, "auth_demo", "secret_key")
