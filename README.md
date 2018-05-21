Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag                             | Ruby  | Node   | Yarn  | ChefDK | JavaSDK |
|--------------------------------------|-------|--------|-------|--------|---------|
| mckessoncds/ci-docker-images:austin  | 2.3.6 | 8.10.0 | 1.5.1 | 1.6.1  |         |
| mckessoncds/ci-docker-images:buffalo | 2.3.7 | 8.11.1 | 1.5.1 | 1.6.1  |         |
| mckessoncds/ci-docker-images:chicago | 2.3.7 | 8.11.1 | 1.5.1 | 1.6.11 |         |
| mckessoncds/ci-docker-images:durham  |       |        |       |        |         |
| mckessoncds/ci-docker-images:eugene  | 2.3.7 | 8.11.1 | 1.5.1 | 1.6.11 |   6u45  |
