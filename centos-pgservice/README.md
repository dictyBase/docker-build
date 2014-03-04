## Using the docker image
    
* Clone the repository

* Build
 
  ```docker build -rm -t pgservice```

* Run

```
    docker run -d -p 5432:5432 -e ADMIN_USER=admin -e ADMIN_PASS=rewrue38i3 \
                -e ADMIN_DB=admin pgservice
```

It will initialize a postgresql cluster and create an admin user with an admin
database. In case the admin environmental variables are not set, default values are use.

__Optional environmental variables:__

ADMIN_USER: default is *docker*

ADMIN_PASS: A random 12 characters alphanumeric  password

ADMIN_DB: default is *docker*

