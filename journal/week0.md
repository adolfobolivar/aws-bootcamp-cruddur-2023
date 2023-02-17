# Week 0 — Billing and Architecture

I watched the pre-requisite videos and created accounts in Gitpod, Honeycomb and Roller, then I configured the IAM account, enabled MFA, 

![mfa](https://user-images.githubusercontent.com/17748375/219808302-dfd1187f-c522-4c1d-aa15-28a041803914.png)

set a US$10 budget 

![budget](https://user-images.githubusercontent.com/17748375/219807575-be497e16-17c1-4e53-99c7-5d693892eb45.png)

and activated the alarm to notify me when I expend 50%, 80% and 100% of budget via AWS Console.

![alerts](https://user-images.githubusercontent.com/17748375/219807642-8b8a0e37-3b66-4786-a144-f10e3a05d31d.png)

I installed the gitpod extension in Chrome to get the gitpod button in my GitHub repo,

![button](https://user-images.githubusercontent.com/17748375/219805184-80ea7240-01ca-4b02-a952-c36ed50bf94c.png)

 and then I did the PR to initialize gitpod (install AWS cli).

![cli](https://user-images.githubusercontent.com/17748375/219805923-46c5da16-3cd9-4ad5-9ab5-5a37c7d7762c.png)

 ```> aws sts get-caller-identity
{
    "UserId": "AIDAV7LEQWEEJLKZPMTW5",
    "Account": "XXXXYYYYZZZZ",
    "Arn": "arn:aws:iam::XXXXYYYYZZZZ:user/gitpod"
}
```

Finally I created the logical and architecture diagrams in Lucidchart:

Napkin design:

![napkin](https://user-images.githubusercontent.com/17748375/219804010-c7b6e8d5-1105-4f3b-9ea4-69fd6ee497da.png)

Logical design:
![logical-design](https://user-images.githubusercontent.com/17748375/219804053-bf84fb71-f365-4073-8902-982a453080c9.png)
