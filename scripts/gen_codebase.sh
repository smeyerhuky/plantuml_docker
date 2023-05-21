# #!/bin/bash
## V1
# # Generate sequence diagram 'wrap_plantuml_with_docker.puml'
# echo -e "@startuml wrap_plantuml_with_docker\n\nUser -> Dockerfile: Pull PlantUML image\nactivate Dockerfile\nDockerfile -> Dockerfile: Build Docker image\nDockerfile -> Dockerfile: Tag Docker image\nDockerfile -> Dockerfile: Push Docker image\nUser <-- Dockerfile: Docker image\n@enduml" > wrap_plantuml_with_docker.puml

# # Generate sequence diagram 'deploy_wrapped_plantumldocker_to_dockerhub.puml'
# echo -e "@startuml deploy_wrapped_plantumldocker_to_dockerhub\n\nUser -> "GitHub Actions": Trigger build-and-push workflow\nactivate GitHub Actions\nGitHub Actions -> "GitHub Actions": Check out source code\nGitHub Actions -> "Docker Hub": Log in to Docker Hub\nactivate Docker Hub\nGitHub Actions -> "Docker Hub": Build and push Docker image\nGitHub Actions -> "Docker Hub": Push Docker image\nGitHub Actions <-- Docker Hub: Docker image\nGitHub Actions -> User: Send notification\n@enduml" > deploy_wrapped_plantumldocker_to_dockerhub.puml

# # Generate sequence diagram 'pull_and_use_docker_plantuml.puml'
# echo -e "@startuml pull_and_use_docker_plantuml\n\nUser -> "Docker Hub": Pull Docker image\nactivate Docker Hub\nUser -> Docker: Run Docker image\nactivate Docker\nDocker -> Docker: Generate UML diagrams\nUser <-- Docker: UML diagrams\n@enduml" > pull_and_use_docker_plantuml.puml

# # Generate Dockerfile
# echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tsvg\", \"-p\"]" > Dockerfile

# # Generate README.md
# echo -e "# PlantUML Docker Image\n\nThis Docker image allows you to generate UML diagrams from text using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Make sure you have Docker installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`\`\`bash\n   git clone https://github.com/smeyerhuky/plantuml_docker.git\n   \`\`\`\n\n3. Enter the cloned repository:\n   \`\`\`bash\n   cd plantuml_docker\n   \`\`\`\n\n4. Update the Dockerfile with the latest version of PlantUML. You can find the latest release of PlantUML on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`\`\`bash\n   docker build -t smeyerhuky/plantuml .\n   \`\`\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`\`\`bash\n   docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the specific version of PlantUML you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`\`\`bash\n   docker push smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n" > README.md

# # Generate build-and-push.yml
# echo -e "name: Build and Push Docker image\n\non:\n  workflow_dispatch:\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Check out source code\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n\n      - name: Send notification\n        run: |\n          # Here you can use a command-line tool or a script to send a notification,\n          # or you could use a GitHub Actions marketplace action that does it.\n" > .github/workflows/build-and-push.yml

# # Generate .gitignore
# echo -e "# Ignore Docker-specific files\nDockerfile" > .gitignore

# #!/bin/bash
# # V2
# # Create necessary directories
# mkdir -p {diagrams,.github/workflows}

# # Generate sequence diagram 'wrap.puml'
# echo -e "@startuml wrap\n\nUser -> Dockerfile: Pull PlantUML\nactivate Dockerfile\nDockerfile -> Dockerfile: Build Docker\nDockerfile -> Dockerfile: Tag Docker\nDockerfile -> Dockerfile: Push Docker\nUser <-- Dockerfile: Docker\n@enduml" > diagrams/wrap.puml

# # Generate sequence diagram 'deploy.puml'
# echo -e "@startuml deploy\n\nUser -> GitHub: Trigger build-and-push\nactivate GitHub\nGitHub -> GitHub: Checkout source\nGitHub -> "Docker Hub": Log in to Docker Hub\nactivate Docker Hub\nGitHub -> "Docker Hub": Build and push\nGitHub -> "Docker Hub": Push Docker\nGitHub <-- Docker Hub: Docker\nGitHub -> User: Send notification\n@enduml" > diagrams/deploy.puml

# # Generate sequence diagram 'use.puml'
# echo -e "@startuml use\n\nUser -> "Docker Hub": Pull Docker\nactivate Docker Hub\nUser -> Docker: Run Docker\nactivate Docker\nDocker -> Docker: Generate UML\nUser <-- Docker: UML\n@enduml" > diagrams/use.puml

# # Generate Dockerfile
# echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tsvg\", \"-p\"]" > Dockerfile

# # Generate README.md
# echo -e "# PlantUML Docker\n\nThis Docker image enables generating UML diagrams using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`\`\`bash\n   git clone https://github.com/smeyerhuky/plantuml_docker.git\n   \`\`\`\n\n3. Navigate to the cloned repository:\n   \`\`\`bash\n   cd plantuml_docker\n   \`\`\`\n\n4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`\`\`bash\n   docker build -t smeyerhuky/plantuml .\n   \`\`\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`\`\`bash\n   docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the specific PlantUML version you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`\`\`bash\n   docker push smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n" > README.md

# # Generate build-and-push.yml
# echo -e "name: Build and Push\n\non:\n  workflow_dispatch:\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Checkout source\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n\n      - name: Send notification\n        run: |\n          # Use a command-line tool or script to send a notification\n" > .github/workflows/build-and-push.yml

# # Generate .gitignore
# echo -e "# Ignore Docker-specific files\nDockerfile" > .gitignore

# #!/bin/bash
# # V3
# # Create necessary directories
# mkdir -p {diagrams,.github/workflows}

# # Generate sequence diagram 'wrap.puml'
# echo -e "@startuml wrap\n\nUser -> \"Dockerfile\": Pull PlantUML\nactivate \"Dockerfile\"\n\"Dockerfile\" -> \"Dockerfile\": Build Docker\n\"Dockerfile\" -> \"Dockerfile\": Tag Docker\n\"Dockerfile\" -> \"Dockerfile\": Push Docker\nUser <-- \"Dockerfile\": Docker\n@enduml" > diagrams/wrap.puml

# # Generate sequence diagram 'deploy.puml'
# echo -e "@startuml deploy\n\nUser -> \"GitHub Actions\": Trigger build-and-push\nactivate \"GitHub Actions\"\n\"GitHub Actions\" -> \"GitHub Actions\": Checkout source\n\"GitHub Actions\" -> \"Docker Hub\": Log in to Docker Hub\nactivate \"Docker Hub\"\n\"GitHub Actions\" -> \"Docker Hub\": Build and push\n\"GitHub Actions\" -> \"Docker Hub\": Push Docker\n\"GitHub Actions\" <-- \"Docker Hub\": Docker\n\"GitHub Actions\" -> User: Send notification\n@enduml" > diagrams/deploy.puml

# # Generate sequence diagram 'use.puml'
# echo -e "@startuml use\n\nUser -> \"Docker Hub\": Pull Docker\nactivate \"Docker Hub\"\nUser -> \"Docker\": Run Docker\nactivate \"Docker\"\n\"Docker\" -> \"Docker\": Generate UML\nUser <-- \"Docker\": UML\n@enduml" > diagrams/use.puml

# # Generate Dockerfile
# echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tsvg\", \"-p\"]" > Dockerfile

# # Generate README.md
# echo -e "# PlantUML Docker\n\nThis Docker image enables generating UML diagrams using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`\`\`bash\n   git clone https://github.com/smeyerhuky/plantuml_docker.git\n   \`\`\`\n\n3. Navigate to the cloned repository:\n   \`\`\`bash\n   cd plantuml_docker\n   \`\`\`\n\n4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`\`\`bash\n   docker build -t smeyerhuky/plantuml .\n   \`\`\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`\`\`bash\n   docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the specific PlantUML version you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`\`\`bash\n   docker push smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n" > README.md

# # Generate build-and-push.yml
# echo -e "name: Build and Push\n\non:\n  workflow_dispatch:\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Checkout source\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n\n      - name: Send notification\n        run: |\n          # Use a command-line tool or script to send a notification\n" > .github/workflows/build-and-push.yml

# # Generate .gitignore
# echo -e "# Ignore Docker-specific files\nDockerfile" > .gitignore

# #!/bin/bash
# # V4
# # Create necessary directories
# mkdir -p {diagrams,.github/workflows}

# # Generate sequence diagrams with footer

# # wrap.puml
# echo -e "@startuml wrap\n\nUser -> \"Dockerfile\": Pull PlantUML\nactivate \"Dockerfile\"\n\"Dockerfile\" -> \"Dockerfile\": Build Docker\n\"Dockerfile\" -> \"Dockerfile\": Tag Docker\n\"Dockerfile\" -> \"Dockerfile\": Push Docker\nUser <-- \"Dockerfile\": Docker\n\nfooter\nThis diagram represents the wrapping process of PlantUML with Docker.\n\nUse Case:\n- User pulls the image\n- User builds and tags the Docker image\n- User pushes the Docker image\n\nend footer\n\n@enduml" > diagrams/wrap.puml

# # deploy.puml
# echo -e "@startuml deploy\n\nUser -> \"GitHub Actions\": Trigger build-and-push\nactivate \"GitHub Actions\"\n\"GitHub Actions\" -> \"GitHub Actions\": Checkout source\n\"GitHub Actions\" -> \"Docker Hub\": Log in to Docker Hub\nactivate \"Docker Hub\"\n\"GitHub Actions\" -> \"Docker Hub\": Build and push\n\"GitHub Actions\" -> \"Docker Hub\": Push Docker\n\"GitHub Actions\" <-- \"Docker Hub\": Docker\n\"GitHub Actions\" -> User: Send notification\n\nfooter\nThis diagram represents the deployment process of the wrapped PlantUML Docker image to Docker Hub using GitHub Actions.\n\nUse Case:\n- User triggers the build-and-push\n- GitHub Actions checks out the source\n- GitHub Actions logs in to Docker Hub\n- GitHub Actions builds and pushes the Docker image\n- User receives a notification\n\nend footer\n\n@enduml" > diagrams/deploy.puml

# # use.puml
# echo -e "@startuml use\n\nUser -> \"Docker Hub\": Pull Docker\nactivate \"Docker Hub\"\nUser -> \"Docker\": Run Docker\nactivate \"Docker\"\n\"Docker\" -> \"Docker\": Generate UML\nUser <-- \"Docker\": UML\n\nfooter\nThis diagram represents the usage of the wrapped PlantUML Docker image.\n\nUse Case:\n- User pulls the Docker image\n- User runs the Docker container\n- Docker generates UML\n- User receives the UML\n\nend footer\n\n@enduml" > diagrams/use.puml

# # Generate Dockerfile
# echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tsvg\", \"-p\"]" > Dockerfile

# # Generate README.md
# echo -e "# PlantUML Docker\n\nThis Docker image enables generating UML diagrams using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`\`\`bash\n   git clone https://github.com/smeyerhuky/plantuml_docker.git\n   \`\`\`\n\n3. Navigate to the cloned repository:\n   \`\`\`bash\n   cd plantuml_docker\n   \`\`\`\n\n4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`\`\`bash\n   docker build -t smeyerhuky/plantuml .\n   \`\`\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`\`\`bash\n   docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the specific PlantUML version you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`\`\`bash\n   docker push smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n" > README.md

# # Generate build-and-push.yml
# echo -e "name: Build and Push\n\non:\n  workflow_dispatch:\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Checkout source\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n\n      - name: Send notification\n        run: |\n          # Use a command-line tool or script to send a notification\n" > .github/workflows/build-and-push.yml

# # Generate .gitignore
# echo -e "# Ignore Docker-specific files\nDockerfile" > .gitignore

# #!/bin/bash
# # V5
# # Create necessary directories
# mkdir -p {diagrams,.github/workflows,out/diagrams/wrap,out/diagrams/deploy,out/diagrams/use}

# # Generate sequence diagrams with footer

# # wrap.puml
# echo -e "@startuml wrap\n\nUser -> \"Dockerfile\": Pull PlantUML\nactivate \"Dockerfile\"\n\"Dockerfile\" -> \"Dockerfile\": Build Docker\n\"Dockerfile\" -> \"Dockerfile\": Tag Docker\n\"Dockerfile\" -> \"Dockerfile\": Push Docker\nUser <-- \"Dockerfile\": Docker\n\nfooter\nThis diagram represents the wrapping process of PlantUML with Docker.\n\nUse Case:\n- User pulls the image\n- User builds and tags the Docker image\n- User pushes the Docker image\n\nend footer\n\n@enduml" > diagrams/wrap.puml

# # deploy.puml
# echo -e "@startuml deploy\n\nUser -> \"GitHub Actions\": Trigger build-and-push\nactivate \"GitHub Actions\"\n\"GitHub Actions\" -> \"GitHub Actions\": Checkout source\n\"GitHub Actions\" -> \"Docker Hub\": Log in to Docker Hub\nactivate \"Docker Hub\"\n\"GitHub Actions\" -> \"Docker Hub\": Build and push\n\"GitHub Actions\" -> \"Docker Hub\": Push Docker\n\"GitHub Actions\" <-- \"Docker Hub\": Docker\n\"GitHub Actions\" -> User: Send notification\n\nfooter\nThis diagram represents the deployment process of the wrapped PlantUML Docker image to Docker Hub using GitHub Actions.\n\nUse Case:\n- User triggers the build-and-push\n- GitHub Actions checks out the source\n- GitHub Actions logs in to Docker Hub\n- GitHub Actions builds and pushes the Docker image\n- User receives a notification\n\nend footer\n\n@enduml" > diagrams/deploy.puml

# # use.puml
# echo -e "@startuml use\n\nUser -> \"Docker Hub\": Pull Docker\nactivate \"Docker Hub\"\nUser -> \"Docker\": Run Docker\nactivate \"Docker\"\n\"Docker\" -> \"Docker\": Generate UML\nUser <-- \"Docker\": UML\n\nfooter\nThis diagram represents the usage of the wrapped PlantUML Docker image.\n\nUse Case:\n- User pulls the Docker image\n- User runs the Docker container\n- Docker generates UML\n- User receives the UML\n\nend footer\n\n@enduml" > diagrams/use.puml

# # Generate Dockerfile
# echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tsvg\", \"-p\"]" > Dockerfile

# # Generate README.md
# echo -e "# PlantUML Docker\n\nThis Docker image enables generating UML diagrams using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`\`\`bash\n   git clone https://github.com/smeyerhuky/plantuml_docker.git\n   \`\`\`\n\n3. Navigate to the cloned repository:\n   \`\`\`bash\n   cd plantuml_docker\n   \`\`\`\n\n4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`\`\`bash\n   docker build -t smeyerhuky/plantuml .\n   \`\`\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`\`\`bash\n   docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the specific PlantUML version you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`\`\`bash\n   docker push smeyerhuky/plantuml:<plantuml_version>\n   \`\`\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n\n## Diagrams\n\nBelow are the diagrams representing the different processes involved:\n\n### Wrapping Process\n\n![Wrap Process](out/diagrams/wrap/wrap.png)\n\n### Deployment Process\n\n![Deploy Process](out/diagrams/deploy/deploy.png)\n\n### Usage Process\n\n![Use Process](out/diagrams/use/use.png)\n" > README.md

# # Generate build-and-push.yml
# echo -e "name: Build and Push\n\non:\n  workflow_dispatch:\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Checkout source\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n\n      - name: Send notification\n        run: |\n          # Use a command-line tool or script to send a notification\n" > .github/workflows/build-and-push.yml

# # Generate .gitignore
# echo -e "# Ignore Docker-specific files\nDockerfile" > .gitignore

#!/bin/bash
# V6
# Create necessary directories
mkdir -p {diagrams,.github/workflows,out/diagrams/wrap,out/diagrams/deploy,out/diagrams/use}

# Generate sequence diagrams with footer

# wrap.puml
echo -e "@startuml wrap\n\nUser -> \"Dockerfile\": Pull PlantUML\nactivate \"Dockerfile\"\n\"Dockerfile\" -> \"Dockerfile\": Build Docker\n\"Dockerfile\" -> \"Dockerfile\": Tag Docker\n\"Dockerfile\" -> \"Dockerfile\": Push Docker\nUser <-- \"Dockerfile\": Docker\n\nfooter\nThis diagram represents the wrapping process of PlantUML with Docker.\n\nUse Case:\n- User pulls the image\n- User builds and tags the Docker image\n- User pushes the Docker image\n\nend footer\n\n@enduml" > diagrams/wrap.puml

# deploy.puml
echo -e "@startuml deploy\n\nUser -> \"GitHub Actions\": Trigger build-and-push\nactivate \"GitHub Actions\"\n\"GitHub Actions\" -> \"GitHub Actions\": Checkout source\n\"GitHub Actions\" -> \"Docker Hub\": Log in to Docker Hub\nactivate \"Docker Hub\"\n\"GitHub Actions\" -> \"Docker Hub\": Build and push\n\"GitHub Actions\" -> \"Docker Hub\": Push Docker\n\"GitHub Actions\" <-- \"Docker Hub\": Docker\n\"GitHub Actions\" -> User: Send notification\n\nfooter\nThis diagram represents the deployment process of the wrapped PlantUML Docker image to Docker Hub using GitHub Actions.\n\nUse Case:\n- User triggers the build-and-push\n- GitHub Actions checks out the source\n- GitHub Actions logs in to Docker Hub\n- GitHub Actions builds and pushes the Docker image\n- User receives a notification\n\nend footer\n\n@enduml" > diagrams/deploy.puml

# use.puml
echo -e "@startuml use\n\nUser -> \"Docker Hub\": Pull Docker\nactivate \"Docker Hub\"\nUser -> \"Docker\": Run Docker\nactivate \"Docker\"\n\"Docker\" -> \"Docker\": Generate UML\nUser <-- \"Docker\": UML\n\nfooter\nThis diagram represents the usage of the wrapped PlantUML Docker image.\n\nUse Case:\n- User pulls the Docker image\n- User runs the Docker container\n- Docker generates UML\n- User receives the UML\n\nend footer\n\n@enduml" > diagrams/use.puml

# Generate Dockerfile
echo -e "FROM plantuml/plantuml-server\nWORKDIR /usr/src/app\nCMD [\"java\", \"-Djava.awt.headless=true\", \"-jar\", \"plantuml.jar\", \"-tpng\", \"-o\", \"/output\", \"/plantuml/*.puml\"]" > Dockerfile

# Generate README.md
echo -e "# PlantUML Docker\n\nThis Docker image enables generating UML diagrams using PlantUML.\n\n## How to Update and Deploy\n\nTo update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Clone the PlantUML Docker repository:\n   \`git clone https://github.com/smeyerhuky/plantuml_docker.git\`\n\n3. Navigate to the cloned repository:\n   \`cd plantuml_docker\`\n\n4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).\n\n5. Build the Docker image:\n   \`docker build -t smeyerhuky/plantuml .\`\n\n6. Tag the Docker image with the PlantUML version:\n   \`docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>\`\n\n   Replace \`<plantuml_version>\` with the specific PlantUML version you are using.\n\n7. Push the Docker image to Docker Hub:\n   \`docker push smeyerhuky/plantuml:<plantuml_version>\`\n\n   Replace \`<plantuml_version>\` with the version you tagged in the previous step.\n\n8. The Docker image is now updated and available on Docker Hub.\n\nNote: Remember to update the Dockerfile and tag the image with the appropriate version for each release.\n\n## How to Use\n\n### Running the Docker Container Locally\n\nTo generate an image from a PlantUML file using the Docker container, follow these steps:\n\n1. Ensure Docker is installed on your machine.\n\n2. Create a directory on your local machine to store the PlantUML files and the output image(s). For example, create a directory named \`plantuml\` in your current working directory.\n\n3. Place your PlantUML file(s) inside the \`plantuml\` directory.\n\n4. Open a terminal or command prompt and navigate to the root directory of your project.\n\n5. Run the following Docker command:\n\n   \`docker run --rm -v \"\$(pwd)/plantuml:/plantuml\" -v \"\$(pwd)/output:/output\" smeyerhuky/plantuml -tpng <path_to_puml_file>\`\n\n   Replace \`<path_to_puml_file>\` with the actual path to your PlantUML file relative to the \`plantuml\` directory. For example, if your PlantUML file is named \`diagram.puml\` and located directly inside the \`plantuml\` directory, you can use \`diagram.puml\` as the \`<path_to_puml_file>\`.\n\n   This command will convert the specified PlantUML file to an image and save it in the \`output\` directory.\n\n6. Check the \`output\` directory for the generated image(s).\n\n   If you placed multiple PlantUML files in the \`plantuml\` directory, each file will be converted to a separate image.\n\n   You can repeat the Docker command for each PlantUML file you want to convert.\n\n## Diagrams\n\nBelow are the diagrams representing the different processes involved:\n\n### Wrapping Process\n\n![Wrap Process](out/diagrams/wrap/wrap.png)\n\n### Deployment Process\n\n![Deploy Process](out/diagrams/deploy/deploy.png)\n\n### Usage Process\n\n![Use Process](out/diagrams/use/use.png)" > README.md

# Generate build-and-push.yml
echo -e "name: Build and Push\n\non:\n  push:\n    branches:\n      - main\n\njobs:\n  build-and-push:\n    runs-on: ubuntu-latest\n    steps:\n      - name: Checkout source\n        uses: actions/checkout@v2\n\n      - name: Log in to Docker Hub\n        uses: docker/login-action@v1\n        with:\n          username: \${{ secrets.DOCKER_HUB_USERNAME }}\n          password: \${{ secrets.DOCKER_HUB_PASSWORD }}\n\n      - name: Build and push Docker image\n        uses: docker/build-push-action@v2\n        with:\n          context: .\n          push: true\n          tags: smeyerhuky/plantuml:latest\n" > .github/workflows/build-and-push.yml
