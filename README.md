Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag                                    | Ruby  | Rubygems | Bundler | Node   | Yarn  | ChefDK | JavaJDK |
|---------------------------------------------|------:|---------:|--------:|-------:|------:|-------:|--------:|
| mckessoncds/ci-docker-images:austin         | 2.3.6 |    2.7.5 |         | 8.10.0 | 1.5.1 |  1.6.1 |         |
| mckessoncds/ci-docker-images:buffalo        | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 |  1.6.1 |         |
| mckessoncds/ci-docker-images:chicago        | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 | 1.6.11 |         |
| mckessoncds/ci-docker-images:durham         | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 | 1.6.11 |    6u45 |
| ~~mckessoncds/ci-docker-images:eugene~~     |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:fresno         | 2.3.7 |    2.7.7 |         | 8.11.2 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:fresno-ubuntu  | 2.3.7 |    2.7.7 |  1.16.2 | 8.11.2 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:garland        | 2.3.7 |    2.7.7 |         | 8.11.3 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:garland-ubuntu | 2.3.7 |    2.7.7 |  1.16.2 | 8.11.3 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:houston        | 2.5.1 |    2.7.7 |  1.16.2 | 8.11.3 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:ithaca         | 2.3.7 |    2.7.7 |  1.16.3 | 8.11.3 | 1.9.4 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:juneau         |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:kannapolis     |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:leicester      |       |          |         |        |       |        |         |


Docker for Mac
--------------

https://store.docker.com/editions/community/docker-ce-desktop-mac

- Download, drag to Applications, run it and log in.


To Prepare a New Image
----------------------

- git co -b <name of next unused city - see above>
- Fill in the new image resource versions above. 
- Add a new city name to the alphabetical sequence.
- Make the version changes in the Dockerfile
- git add/commit/push
- When the new image has been built, run `docker run -it
    mckessoncds/ci-docker-images:<image-name> /bin/bash`
  Note: This will download the image.

Java JDK
--------

The JDK download is here:

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
