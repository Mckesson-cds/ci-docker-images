Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing
for an Ruby/Node application. The intention is create baseline images that CI
will use to run and test our application. These images have the required
language support (Ruby, Node), and required test tools (ChefDK, phantomjs,
codeclimate).


The naming convention is as follows:

| Name:tag               | Ruby   | Node   | Yarn   | ChefDK |
|------------------------|--------|--------|--------|--------|
| mckessoncds/ci:austin  | 2.3.6  | 8.10.0 | 1.5.1  | 1.6.1  |
| mckessoncds/ci:boston  |        |        |        |        |
| mckessoncds/ci:chicago |        |        |        |        |
| mckessoncds/ci:durham  |        |        |        |        |


Building
--------

Update the Dockerfile and rebuild using

```
% docker build . -t mckessoncds/ci:<tag-name>
```

Then push to dockerhub

```
% docker login
% docker push mckessoncds/ci:<tag-name>
```
