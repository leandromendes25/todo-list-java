FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y \
    openjdk-21-jdk -y && apt-get install maven -y && mvn clean install
#Porta usada pelo nosso projeto
EXPOSE 8080 
#precisa de uma imagem base para abrir a aplciação
FROM openjdk:21-jdk-slim
COPY --from=build /target/todolist-1.0.0.jar app.jar
#comando java para executar arquivos .jar
#java -jar nome da pasta
ENTRYPOINT [ "java", "-jar", "app.jar" ]