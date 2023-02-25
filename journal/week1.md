# Week 1 — App Containerization

#I got the 200 OK response and access to json answer! 
`````
192.168.41.137 - - [25/Feb/2023 21:22:22] "GET / HTTP/1.1" 404 -
192.168.41.137 - - [25/Feb/2023 21:23:42] "GET /api/activities/home HTTP/1.1" 200 -
192.168.41.137 - - [25/Feb/2023 21:23:53] "GET /api/activities/home HTTP/1.1" 200 -
``````

#docker image created
````
gitpod /workspace/aws-bootcamp-cruddur-2023 (main) $ docker images
REPOSITORY      TAG                IMAGE ID       CREATED          SIZE
backend-flask   latest             f9206a4b6965   39 minutes ago   129MB
python          3.10-slim-buster   934047247b20   22 hours ago     118MB
````

#error when i tried to ran the docker container, solution:
````
 Error starting userland proxy: listen tcp4 0.0.0.0:4567: bind: address already in use.

 sudo lsof -i tcp:4567
COMMAND  PID   USER   FD   TYPE   DEVICE SIZE NODE NAME
python3 3139 gitpod    3u  IPv4 31168562       TCP *:4567 (LISTEN)

$ sudo kill -9 3139
[2]+  Killed                  python3 -m flask run --host=0.0.0.0 --port=4567  (wd: /workspace/aws-bootcamp-cruddur-2023/backend-flask)
````

# command to check backend container = OK! 
```
docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
```

# docker image created
```
gitpod /workspace/aws-bootcamp-cruddur-2023 (main) $ docker images
REPOSITORY          TAG                IMAGE ID       CREATED             SIZE
frontend-react-js   latest             6fb2630a33ae   5 minutes ago       1.15GB
backend-flask       latest             f9206a4b6965   About an hour ago   129MB
python              3.10-slim-buster   934047247b20   23 hours ago        118MB
node                16.18              993a4cf9c1e8   2 months ago        910MB
````

# docker compose up command completed
````
gitpod /workspace/aws-bootcamp-cruddur-2023 (main) $ docker compose up
[+] Building 27.9s (18/18) FINISHED    
````
# frontend and backend connected, image:

![docker](https://user-images.githubusercontent.com/17748375/221382584-901ca3cd-aea2-4e97-9ec3-b047b3f35222.png)
