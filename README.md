PKS Demo

App uses MySQL service.
```
$ ./mvnw spring-boot:run
```

1. Repo - https://github.com/Pivotal-Field-Engineering/pcf-ers-demo
2. docker build -f Dockerfile -t pks-demo .
3. docker run -it --rm -p 80:8080 pks-demo