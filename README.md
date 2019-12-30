Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag       | Ruby  | Rubygems | Bundler |  Node   |  Yarn  | ChefDK | JavaJDK | chromedriver  |
|----------------|------:|---------:|--------:|--------:|-------:|-------:|--------:|--------------:|
| austin         | 2.3.6 |   2.7.5  |         | 8.10.0  |  1.5.1 |  1.6.1 |         |               |
| buffalo        | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 |  1.6.1 |         |               |
| chicago        | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 | 1.6.11 |         |               |
| durham         | 2.3.7 |   2.7.5  |         | 8.11.1  |  1.5.1 | 1.6.11 |  6u45   |               |
| ~~eugene~~     |       |          |         |         |        |        |         |               |
| fresno         | 2.3.7 |   2.7.7  |         | 8.11.2  |  1.7.0 | 1.6.11 |  6u45   |               |
| fresno-ubuntu  | 2.3.7 |   2.7.7  |  1.16.2 | 8.11.2  |  1.7.0 | 1.6.11 |  6u45   |               |
| garland        | 2.3.7 |   2.7.7  |         | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |               |
| garland-ubuntu | 2.3.7 |   2.7.7  |  1.16.2 | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |               |
| houston        | 2.5.1 |   2.7.7  |  1.16.2 | 8.11.3  |  1.7.0 | 1.6.11 |  6u45   |               |
| ithaca         | 2.3.7 |   2.7.7  |  1.16.3 | 8.11.3  |  1.9.4 | 1.6.11 |  6u45   |               |
| juneau         | 2.3.7 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |               |
| kannapolis     | 2.5.1 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |               |
| leicester      | 2.3.8 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |               |
| minneapolis    | 2.3.8 |   2.7.7  |  1.16.6 | 8.12.0  | 1.10.1 | 1.6.11 |  6u45   |               |
| new-orleans    | 2.5.1 |   2.7.8  |  1.17.1 | 10.13.0 | 1.12.3 | 1.6.11 |  6u45   |               |
| orlando        |       |          |         |         |        |        |         |               |
| portland       | 2.5.1 |   2.7.8  |  1.17.1 | 10.14.0 | 1.12.3 | 1.6.11 |  6u45   |               |
| quebec         | 2.5.x |   2.7.8  |  1.17.3 | 10.15.1 | 1.13.0 | 1.6.11 |  6u45   |     2.46      |
| rochester      | 2.5.x |   3.0.3  |   2.0.1 | 10.15.2 | 1.15.2 | 1.6.11 |  6u45   | 73.0.3683.68  |
| 2019.05.02     | 2.5.x |   3.0.3  |   2.0.1 | 10.15.2 | 1.15.2 | 1.6.11 |  6u45   | 74.0.3729.6   |
| 2019.06.11     | 2.6.x |   3.0.3  |   2.0.1 | 10.16.0 | 1.16.0 | 1.6.11 |  6u45   | 75.0.3770.8   |
| 2019.08.05     | 2.6.x |   3.0.3  |   2.0.2 | 10.16.1 | 1.17.3 | 1.6.11 |  6u45   | 76.0.3809.68  |
| 2019.10.11     | 2.6.x |   3.0.6  |   2.0.2 | 10.16.3 | 1.19.1 | 1.6.11 |  6u45   | 77.0.3865.40  |
| 2019.10.26     | 2.6.x |   3.0.6  |   2.0.2 | 12.13.0 | 1.19.1 | 1.6.11 |  6u45   | 78.0.3904.70  |
| 2019.12.30     | 2.6.x |   3.0.6  |   2.1.2 | 12.14.0 | 1.21.1 | 1.6.11 |  6u45   | 79.0.3945.36  |

Docker for Mac
--------------

https://store.docker.com/editions/community/docker-ce-desktop-mac

- Download, drag to Applications, run it and log in.


To Prepare a New Image
----------------------

- git co -b <current date>
- Edit this README.md.
  - Document the new image resource versions above.
- Make the version changes in the Dockerfile.  NOTE: Check http://chromedriver.chromium.org/home to determine the current stable chromedriver version.  Also, the ruby version with be the latest patchlevel ruby-ng release for the specified major and minor version in the Dockerfile. E.g., https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng/+index?field.series_filter=xenial
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
