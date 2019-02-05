Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag       | Ruby  | Rubygems | Bundler |  Node   |  Yarn  | ChefDK | JavaJDK | Chrome | chromedriver |
|----------------|------:|---------:|--------:|--------:|-------:|-------:|--------:|-------:|-------------:|
| austin         | 2.3.6 |   2.7.5  |         | 8.10.0  |  1.5.1 |  1.6.1 |         |        |              |
| buffalo        | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 |  1.6.1 |         |        |              |
| chicago        | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 | 1.6.11 |         |        |              |
| durham         | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 | 1.6.11 |  6u45   |        |              |
| ~~eugene~~     |       |          |         |         |        |        |         |        |              |
| fresno         | 2.3.7 |   2.7.7  |         | 8.11.2  |  1.7.0 | 1.6.11 |  6u45   |        |              |
| fresno-ubuntu  | 2.3.7 |   2.7.7  |  1.16.2 | 8.11.2  |  1.7.0 | 1.6.11 |  6u45   |        |              |
| garland        | 2.3.7 |   2.7.7  |         | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |        |              |
| garland-ubuntu | 2.3.7 |   2.7.7  |  1.16.2 | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |        |              |
| houston        | 2.5.1 |   2.7.7  |  1.16.2 | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |        |              |
| ithaca         | 2.3.7 |   2.7.7  |  1.16.3 | 8.11.3  |  1.9.4 | 1.6.11 |  6u45   |        |              |
| juneau         | 2.3.7 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |        |              |
| kannapolis     | 2.5.1 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |        |              |
| leicester      | 2.3.8 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |        |              |
| minneapolis    | 2.3.8 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |        |              |
| new-orleans    | 2.5.1 |   2.7.8  |  1.17.1 | 10.13.0 | 1.12.3 | 1.6.11 |  6u45   |        |              |
| orlando        |       |          |         |         |        |        |         |        |              |
| portland       | 2.5.1 |   2.7.8  |  1.17.1 | 10.14.0 | 1.12.3 | 1.6.11 |  6u45   |        |              |
| quebec         | 2.5.x |   2.7.8  |  1.17.3 | 10.15.1 | 1.13.0 | 1.6.11 |  6u45   |   72   |    2.46      |
| rochester      |       |          |         |         |        |        |         |        |              |
| seattle        |       |          |         |         |        |        |         |        |              |


Docker for Mac
--------------

https://store.docker.com/editions/community/docker-ce-desktop-mac

- Download, drag to Applications, run it and log in.


To Prepare a New Image
----------------------

- git co -b <name of next unused city - see above>
- Edit this README.md.
  - Document the new image resource versions above.
  - Add a new city name to the end of the alphabetical sequence above.
- Make the version changes in the Dockerfile.
- `git add .` / `git commit` / `git push --set-upstream origin {{branch-name}}`
- When the new image has been built, run `docker run -it mckessoncds/ci-docker-images:{{image-name}} /bin/bash`
  Note: This will download the image and open a shell.
- When the image loads, confirm the resource versions.
- `git tag {{branch-name}}`
- `git push --tags` # This will trigger a build of the docker image for CircleCI to use.

Java JDK
--------

The JDK download is here:

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
