# Week 3 — Decentralized Authentication

#Integration with Cognito working as expected
email_verified: True
name: "Adolfo"
preferred_username:"Adolfo"
sub: "a14530c2-315c-44a5-aa1d-db5a1922d064"

![auth done](https://user-images.githubusercontent.com/17748375/224552769-82699cc4-f919-422e-9a44-55f10def21d9.png)

#Signup page sync with Cognito

![signup page](https://user-images.githubusercontent.com/17748375/224552777-9cb6efab-d898-48bb-9a02-a493817293e8.png)

#Recovery password page done

![reco](https://user-images.githubusercontent.com/17748375/224552878-897df472-c19f-4207-a7d1-bdf57dc37bab.png)

#Access Token authenticated
192.168.195.11 - - [13/Mar/2023 14:49:12] "GET /api/activities/home HTTP/1.1" 200 -
192.168.195.11 - - [13/Mar/2023 14:53:48] "OPTIONS /api/activities/home HTTP/1.1" 200 -
[2023-03-13 14:53:49,053] DEBUG in app: authenicated
[2023-03-13 14:53:49,054] DEBUG in app: {'sub': '809a74ca-f3ca-4ffe-bd2c-XXXXXXX', 'iss': 'https://cognito-idp.us-east-1.amazonaws.com/us-east-1_gaXvzwtXA', 'client_id': '20rrbsahs8lbqqj5bXXXXXXX', 'origin_jti': '19a4c704-6e75-4594-adf9-XXXXXXX', 'event_id': '3131a932-9a7b-463d-91f8-XXXXXXX', 'token_use': 'access', 'scope': 'aws.cognito.signin.user.admin', 'auth_time': 1678719228, 'exp': 1678722828, 'iat': 1678719228, 'jti': '0e6d43b3-00fe-4b46-a8d9-XXXXXXX', 'username': '809a74ca-f3ca-4ffe-bd2c-XXXXXXX'}
