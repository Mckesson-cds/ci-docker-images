
## NOTICE 

**CDS Images are stored in JFROG, you must be a member of the ontada-cds group to access them**

These will be moved into their respective applications when we move into Enterprise Github. CI/CD will be moved into Github Actions and this repo will be archived.

JFrog Deploy Prerequisties
1. McKesson email or dID
2. JFrog API Key enabled for that ID

1. Log into the repository using `docker login mck-cds.jfrog.io`, this will prompt you for the credentials.

2. All these images live in the same repository, to pull the image, use `docker pull mck-cds.jfrog.io/cds:<image-name>`

3. Once you make the necessary changes, push a new image back using `docker build -f Dockerfile.<app_name> -t <YYYY-MM-DD>-<app_name>`

4. Test the new image using `docker run -it mck-cds.jfrog.io:<image tag> /bin/bash`

5. Then upload it to JFrog with `docker push mck-cds.jfrog.io:<image tag>`


_Dockerfile.chefdk does not appear to be in use._

***
# OLD INSTRUCTIONS - NOT CURRENT
## To Create and Upload New Image(s)

1. git co -b \<JIRA ticket ID>
2. Edit this README.md. Document the new image resource versions above.
3. Make the version changes in the Dockerfile. NOTE: Check http://chromedriver.chromium.org/home to determine the current stable chromedriver version. We only specify the major and minor version for the ruby version. The version that is built into docker images is whatever the most recent patchlevel release is available from the FullStaq ruby repository. The same is true for our production server instances. When new instances are made, they get the latest ruby patchlevel version available.
4. To create an image, follow this example: <br />`docker build -f Dockerfile.<env> -t mckessoncds/ci-docker-images:<image tag> .` <br />NOTE: Tag in the form \<date>-<cvp, cds, quill or chefdk>
5. Test the image, checking the versions: `docker run -it mckessoncds/ci-docker-images:<image tag> /bin/bash`
6. To push the new image(s) to hub.docker.com, run `docker push mckessoncds/ci-docker-images:<image tag>`
7. Create and merge a PR, and then tag a Github and Jira release

## Current Docker Images for CircleCI

These are [public images](https://hub.docker.com/r/mckessoncds/ci-docker-images) to run CI (continuous integration) building and testing for an Ruby/Node application. The intention is create baseline images that CI will use to run and test our application. These images have the required language support (Ruby, Node), and required test tools (ChefDK, phantomjs, codeclimate).

The naming convention is as follows (alphabetically increasing city names):

|          Name:tag |  Ruby | Rubygems | Bundler |    Node |   Yarn  |  chromedriver |
| ----------------: | ----: | -------: | ------: | ------: |  -----: | ------------: |
|    2021.09.13-cds | 2.7.7 |    3.1.6 |  2.3.26 | 12.22.6 | 1.22.5  |  93.0.4577.63 |
|    2021.09.13-cvp | 2.7.7 |    3.1.6 |  2.3.26 | 16.19.1 | 1.22.19 |  93.0.4577.63 |
|  2021.09.13-quill | 2.7.7 |    3.1.6 |  2.3.26 | 16.19.1 | 1.22.19 |  93.0.4577.63 |
| 2021.08.04-chefdk | 2.3.5 |   2.6.14 |  1.16.0 |         |         |               |

Note: Going forward, our server instances will use the version of rubygems that is provided by FullStaq ruby.

## Docker for Mac

https://store.docker.com/editions/community/docker-ce-desktop-mac

- Download, drag to Applications, run it and log in.

## Java JDK

The JDK download is here:

http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html

## ChefDK

OpsWorks requires that we use a very old version of ChefDK (1.6.11).

Download link:

https://downloads.chef.io/tools/download/chefdk?download=https://packages.chef.io/files/stable/chefdk/1.6.11/mac_os_x/10.13/chefdk-1.6.11-1.dmg&os=macOS%2010.13&version=1.6.11
