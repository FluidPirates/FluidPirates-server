curl -F "email=test@example.com" -F "password=test@example.com" http://localhost:3000/api/sessions
curl http://localhost:3000/api/users/current\?token\=caea24af976362a2f010650baf118484
curl -X DELETE http://localhost:3000/api/sessions?token\=caea24af976362a2f010650baf118484
