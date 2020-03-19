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
9. Create DNS for Ingress
10. openssl req -x509 \
  -nodes -newkey rsa:4096 \
  -keyout KEY-PATH.pem \
  -out CERT-PATH.pem \
  -days 365 \
  -subj "/CN=*.user1.caas.pez.pivotal.io"
11. kubectl create secret tls INGRESS-CERT --key KEY-PATH.pem --cert CERT-PATH.pem
12. kubectl --namespace default port-forward ins1-pks-demo-7fcbb8c5d4-gtlts 8090:8080
13. http://localhost:8090/
14. fly -t caas login -c https://concourse.caas.pez.pivotal.io/