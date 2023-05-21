FROM plantuml/plantuml-server
WORKDIR /usr/src/app
CMD ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-tpng", "-o", "/output", "/plantuml/*.puml"]
