# PlantUML Docker

This Docker image enables generating UML diagrams using PlantUML.

## How to Update and Deploy

To update and deploy a new version of the PlantUML Docker image when there is a new release in the PlantUML repository, follow these steps:

1. Ensure Docker is installed on your machine.

2. Clone the PlantUML Docker repository:
   `git clone https://github.com/smeyerhuky/plantuml_docker.git`

3. Navigate to the cloned repository:
   `cd plantuml_docker`

4. Update the Dockerfile with the latest PlantUML version. Find the latest release on the [PlantUML GitHub Releases page](https://github.com/plantuml/plantuml/releases).

5. Build the Docker image:
   `docker build -t smeyerhuky/plantuml .`

6. Tag the Docker image with the PlantUML version:
   `docker tag smeyerhuky/plantuml smeyerhuky/plantuml:<plantuml_version>`

   Replace `<plantuml_version>` with the specific PlantUML version you are using.

7. Push the Docker image to Docker Hub:
   `docker push smeyerhuky/plantuml:<plantuml_version>`

   Replace `<plantuml_version>` with the version you tagged in the previous step.

8. The Docker image is now updated and available on Docker Hub.

Note: Remember to update the Dockerfile and tag the image with the appropriate version for each release.

## How to Use

### Running the Docker Container Locally

To generate an image from a PlantUML file using the Docker container, follow these steps:

1. Ensure Docker is installed on your machine.

2. Create a directory on your local machine to store the PlantUML files and the output image(s). For example, create a directory named `plantuml` in your current working directory.

3. Place your PlantUML file(s) inside the `plantuml` directory.

4. Open a terminal or command prompt and navigate to the root directory of your project.

5. Run the following Docker command:

   `docker run --rm -v "$(pwd)/plantuml:/app/plantuml" -v "$(pwd)/output:/app/output" smeyerhuky/plantuml -tpng /app/plantuml/<path_to_puml_file>`

   Replace `<path_to_puml_file>` with the actual path to your PlantUML file relative to the `plantuml` directory. For example, if your PlantUML file is named `diagram.puml` and located directly inside the `plantuml` directory, you can use `diagram.puml` as the `<path_to_puml_file>`.

   This command will convert the specified PlantUML file to an image and save it in the `output` directory.

6. Check the `output` directory for the generated image(s).

   If you placed multiple PlantUML files in the `plantuml` directory, each file will be converted to a separate image.

   You can repeat the Docker command for each PlantUML file you want to convert.

## Diagrams

Below are the diagrams representing the different processes involved:

### Wrapping Process

![Wrap Process](out/diagrams/wrap/wrap.png)

### Deployment Process

![Deploy Process](out/diagrams/deploy/deploy.png)

### Usage Process

![Use Process](out/diagrams/use/use.png)
