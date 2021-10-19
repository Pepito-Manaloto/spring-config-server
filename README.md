# spring-config-server
Spring Cloud Config Server

#### Sample
- https://localhost:8888/application/dev
- https://localhost:8888/vocabulary-api/default/develop/resourcebundle/messages_en.properties
- https://localhost:8888/vocabulary-api/default/develop/logback.xml

### Certificates
- keytool -genkeypair -alias springconfigserver -keyalg RSA -keysize 4096 -storetype PKCS12 -keystore spring-config-server.p12 -keypass <pass> -storepass <pass> -validity 3650 -dname "CN=spring-config-server,OU=Aaron,O=Aaron,L=Singapore,ST=Singapore,C=PH" -ext SAN=dns:spring-config-server,dns:vocabulary-api,dns:localhost,ip:127.0.0.1
- keytool -export -alias springconfigserver -file spring-config-server.crt -keystore spring-config-server.p12 -storepass <pass>
- keytool -import -alias vocabularyapi -file vocabulary-api.crt -keystore spring-config-server.p12 -storepass <pass>
