Docker Images for CI
====================

These are public images to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag         | Ruby  | Rubygems | Bundler |  Node   |  Yarn  | chromedriver  | Git Repos  |
|------------------|------:|---------:|--------:|--------:|-------:|--------------:|-----------:|
| 2019.05.02       | 2.5.x |  3.0.3   |  2.0.1  | 10.15.2 | 1.15.2 | 74.0.3729.6   |            |
| 2019.06.11       | 2.6.x |  3.0.3   |  2.0.1  | 10.16.0 | 1.16.0 | 75.0.3770.8   |            |
| 2019.08.05       | 2.6.x |  3.0.3   |  2.0.2  | 10.16.1 | 1.17.3 | 76.0.3809.68  |            |
| 2019.10.11       | 2.6.x |  3.0.6   |  2.0.2  | 10.16.3 | 1.19.1 | 77.0.3865.40  |            |
| 2019.10.26       | 2.6.x |  3.0.6   |  2.0.2  | 12.13.0 | 1.19.1 | 78.0.3904.70  | cvp/quill  |
| 2019.12.30       | 2.6.x |  3.0.6   |  2.1.2  | 12.14.0 | 1.21.1 | 79.0.3945.36  | cvp/quill  |
| 2020.01.07       | 2.6.x |  3.0.6   |  2.1.2  | 10.18.0 | 1.21.1 | 79.0.3945.36  | cds-tools  |
| 2020.03.20       | 2.6.x |  3.1.2   |  2.1.4  | 10.19.0 | 1.22.4 | 80.0.3987.106 | cds-tools  |
| 2020.03.21       | 2.6.x |  3.1.2   |  2.1.4  | 12.16.1 | 1.22.4 | 80.0.3987.106 | cvp/quill  |
| 2020.06.05       | 2.6.x |  3.1.2   |  2.1.4  | 10.21.0 | 1.22.4 | 83.0.4103.39  | cds-tools  |
| 2020.06.09       | 2.6.x |  3.1.4   |  2.1.4  | 12.18.0 | 1.22.4 | 83.0.4103.39  | cvp/quill  |
| 2020.08.10-1     | 2.6.x |  3.1.4   |  2.1.4  | 10.22.0 | 1.22.4 | 84.0.4147.30  | cds-tools  |
| 2020.08.10-2     | 2.7.x |  3.1.4   |  2.1.4  | 12.18.3 | 1.22.4 | 84.0.4147.30  | quill      |
| 2020.11.19-cds   | 2.6.x |  3.1.4   |  2.1.4  | 10.22.0 | 1.22.4 | 87.0.4280.20  | cds-tools  |
| 2020.11.19-cvp   | 2.6.x |  3.1.4   |  2.1.4  | 14.15.1 | 1.22.5 | 87.0.4280.20  | cvp        |
| 2021.01.27-1     | 2.7.x |  3.1.4   |  2.1.4  | 14.15.4 | 1.22.5 | 88.0.4324.96  | quill      |
| 2021.01.27-2     | 2.6.x |  3.1.4   |  2.1.4  | 10.23.2 | 1.22.5 | 88.0.4324.96  | cds-tools  |
| 2021.02.01-cvp   | 2.6.x |  3.1.4   |  2.2.7  | 14.15.4 | 1.22.5 | 88.0.4324.96  |
| 2021.02.01-cds   | 2.6.x |  3.1.4   |  2.2.7  | 10.23.2 | 1.22.5 | 88.0.4324.96  |
| 2021.02.01-quill | 2.7.x |  3.1.4   |  2.2.7  | 14.15.4 | 1.22.5 | 88.0.4324.96  |
| 2021.03.18-cds   | 2.6.x |          |  2.2.14 | 10.24.0 | 1.22.5 | 89.0.4389.23  |


**NOTE:  Currently, CDS Tools requires an older node release series (10.x.x), so other products will use a different docker image with the current LTS**


Docker for Mac
--------------

https://store.docker.com/editions/community/docker-ce-desktop-mac

- Download, drag to Applications, run it and log in.


To Prepare a New Image
----------------------

1. git co -b <jira ticket reference for target repo>
2. Edit this README.md. Document the new image resource versions above.
3. Make the version changes in the Dockerfile.  NOTE: Check http://chromedriver.chromium.org/home to determine the current stable chromedriver version.  Also, the ruby version will be the latest patchlevel ruby-ng release for the specified major and minor version in the Dockerfile. E.g., https://launchpad.net/~brightbox/+archive/ubuntu/ruby-ng/+index?field.series_filter=xenial
4. `git add .` / `git commit` / `git push --set-upstream origin {{branch-name}}`
5. When the new image has been built, run `docker run -it mckessoncds/ci-docker-images:{{image-name}} /bin/bash`
  Note: This will download the image and open a shell.
6. When the image loads, confirm the resource versions.
7. Open a GitHub pull request for the branch, get reviews and then merge to master.
8. Create and tag a new release note. In order to make explicit the repo associated with the new image, use this tagging convention:  <date>-<repo abbreviation>. E.g., 2021.01.29-cvp, 2021.01.29-cds, 2021.01.29-quill.
  

A Note to PR Reviewers
----------------------

Because version changes for resources in the Dockerfile are not necessarily between versions for the same repository.  For example, if an image is being made for CDS Tools, the delta between CDS Tools and Quill would be different that the delta between CDS Tools and CVP. 


Java JDK
--------

The JDK download is here:

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html
