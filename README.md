![](https://travis-ci.org/LukinEgor/wearevolt-testing.svg?branch=master)

---
Demo: url - https://wearevolt-testing.herokuapp.com/

Access:
* email: `test1@mail.com`
* password: `test`

---
### Api
* Report Endpoint: POST /api/v1/reports/by_author.json

Example: `curl -X POST -d "email={email}" -d "start_date=10-09-2016" -d "finish_date=10-11-2017" https://wearevolt-testing.herokuapp.com/api/v1/reports/by_author`

* CRUD for users, posts, comments
* Loading avatar on AWS S3
