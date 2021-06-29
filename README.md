Docker Images for CI
====================

These are [public images](https://hub.docker.com/r/mckessoncds/ci-docker-images) to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

| Name:tag          | Ruby  | Rubygems | Bundler |  Node   |  Yarn  | chromedriver  |
|-------------------|------:|---------:|--------:|--------:|-------:|--------------:|
| 2021.06.29-cds    | 2.7.3 |  3.0.3.1 |  2.2.21 | 12.22.1 | 1.22.5 |  91.0.4472.101 |
| 2021.06.03-cvp    | 2.6.7 |  3.0.3.1 |  2.2.17 | 14.17.0 | 1.22.5 |  91.0.4472.19 |
| 2021.06.03-quill  | 2.7.3 |  3.1.6   |  2.2.17 | 14.17.0 | 1.22.5 |  91.0.4472.19 |


2021.03.18-chefdk only provides chefdk 1.6.11, which has an old version of embedded ruby (2.3.5).
2021.03.18-chefdk also includes rubygems 2.6.14 and bundler 1.16.0

Note:  Going forward, our server instances will use the version of rubygems that is provided by FullStaq ruby.


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
