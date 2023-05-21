FROM openjdk:11

ENV PLANTUML_VERSION 1.2022.14
WORKDIR /app

RUN apt-get update && apt-get install -y graphviz
RUN wget https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -O plantuml.jar

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar"]

