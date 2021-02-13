Test Skin Patches
=================

An automated tool to be used during production stage for testing skin patches.

## Instructions to run the container
Install [Docker](https://www.docker.com) and make sure to go through these [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/) on Linux systems.

Once you have Docker properly installed, follow these instructions:
1. Pull the docker image:
    ```sh
    $ docker pull ghcr.io/icub-tech-iit/test-skin-patches:latest
    ```
2. Launch the container:
    ```sh
    $ docker run -it --rm --network host ghcr.io/icub-tech-iit/test-skin-patches:latest
    ```
3. From within the container shell, launch the following scripts:
    ```sh
    $ start-vnc-session.sh
    ```
4. Open up the browser and connect to **`localhost:6080`** to get to the workspace desktop GUI.
5. Once done, from the container shell press **CTRL+D**.

### 👨🏻‍💻 Maintainers
This repository is maintained by:

| | |
|:---:|:---:|
| [<img src="https://github.com/davidetome.png" width="40">](https://github.com/davidetome) | [@davidetome](https://github.com/davidetome) |
| [<img src="https://github.com/pattacini.png" width="40">](https://github.com/pattacini) | [@pattacini](https://github.com/pattacini) |
