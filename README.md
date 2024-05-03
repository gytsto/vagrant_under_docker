# Vagrant and libvirt under docker container

## Building docker image
It is recommended to use GitHub UI to build release versions of docker images. This way there is
a guarantee that the image is built from the versioned version of the Dockerfile and does not contain
any local changes. Additionally the image is labeled with the revision of the project during CI build
so it is easy to trace back the source code used to build the image.

To build a docker image on GitHub UI:
1. Go to the [Actions](https://github.com/gytsto/vagrant_under_docker/actions) page of the project.
2. Select the [Build and Push Docker Image](https://github.com/gytsto/vagrant_under_docker/actions/workflows/docker.yml) workflow on the left.
3. Click the `Run workflow` button.
4. Select branch, set docker image name and tag and click the `Run workflow` button.

## Contributions

We do not expect external contributions to this project.

## License

[This project is licensed under the terms of the GNU General Public License v3.0 only](LICENSE)