Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag                                   | Ruby  | Rubygems | Bundler | Node   | Yarn  | ChefDK | JavaJDK |
|--------------------------------------------|------:|---------:|--------:|-------:|------:|-------:|--------:|
| mckessoncds/ci-docker-images:austin        | 2.3.6 |    2.7.5 |         | 8.10.0 | 1.5.1 |  1.6.1 |         |
| mckessoncds/ci-docker-images:buffalo       | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 |  1.6.1 |         |
| mckessoncds/ci-docker-images:chicago       | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 | 1.6.11 |         |
| mckessoncds/ci-docker-images:durham        | 2.3.7 |    2.7.5 |         | 8.11.1 | 1.5.1 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:eugene        |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:fresno        | 2.3.7 |    2.7.7 |         | 8.11.2 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:fresno-ubuntu | 2.3.7 |    2.7.7 |  1.16.2 | 8.11.2 | 1.7.0 | 1.6.11 |    6u45 |
| mckessoncds/ci-docker-images:garland       |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:houston       |       |          |         |        |       |        |         |
| mckessoncds/ci-docker-images:ithaca        |       |          |         |        |       |        |         |

Java JDK
--------

The JDK download is here:

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
