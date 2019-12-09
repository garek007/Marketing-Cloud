<script runat = "server" >
Platform.Load("Core", "1.1.1");

var authEndpoint = 'https://YOUR_SUBDOMAIN.auth.marketingcloudapis.com/';
var payload = {
client_id: "*****************",
client_secret: "*******************",
grant_type: "client_credentials"
};
var url = authEndpoint + '/v2/token';
var contentType = 'application/json';

try {
var accessTokenRequest = HTTP.Post(url, contentType, Stringify(payload));
if (accessTokenRequest.StatusCode == 200) {
var tokenResponse = Platform.Function.ParseJSON(accessTokenRequest.Response[0]);
var accessToken = tokenResponse.access_token;

var endpoint = "https://YOUR_SUBDOMAIN.rest.marketingcloudapis.com/contacts/v1/contacts/actions/delete?type=listReference";
payload = "";
payload = {
"deleteOperationType": "ContactAndAttributes",
"targetList": {
"listType": {
"listTypeID": 3
},
"listKey": "DE External Key"
},
"deleteListWhenCompleted": false,
"deleteListContentsWhenCompleted": false
};
var s1 = "Bearer ";
var auth = s1.concat(accessToken);
var headerNames = ["Encoding", "Authorization"];
var headerValues = ["utf-8", auth];
var result = HTTP.Post(endpoint, contentType, Stringify(payload), headerNames, headerValues);
Write(Stringify(result));
}
} catch (error) {
Write(Stringify(error));
} < /script>
