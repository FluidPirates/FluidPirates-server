curl -F "email=test@example.com" -F "password=test@example.com" http://localhost:3000/api/sessions
curl http://localhost:3000/api/users/current\?token\=caea24af976362a2f010650baf118484
curl -X DELETE http://localhost:3000/api/sessions?token\=caea24af976362a2f010650baf118484

curl -F "user[email]=test@example.com" -F "user[password]=test@example.com" http://52.31.58.176/api/users

curl -F "group[name]=UTC" -F "group[description]=Engineering school in Compiégne" http://52.31.58.176/api/groups\?token\=c5b529143bd173c314e650c910540b25
