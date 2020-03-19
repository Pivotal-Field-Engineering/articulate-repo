PKS Demo

App uses MySQL service.
```
$ ./mvnw spring-boot:run
```

1. Repo - https://github.com/Pivotal-Field-Engineering/pcf-ers-demo
2. docker build -f Dockerfile -t pks-demo .
3. docker run -it --rm -p 80:8080 pks-demo
4. docker tag pks-demo harbor.caas.pez.pivotal.io/hemanth/pks-demo
5. docker push harbor.caas.pez.pivotal.io/hemanth/pks-demo
6. helm lint
7. helm install ins1 pks-demo --debug --dry-run > delete.yaml
8. helm install ins1 pks-demo
