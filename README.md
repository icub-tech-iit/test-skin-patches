Test Skin Patches
=================

An automated tool to be used during production stage for testing skin patches.

## Instructions to run the container
To run the sandbox locally using [Docker](https://www.docker.com), go through the following steps:
1. Pull the docker image:
    ```sh
    $ docker pull ghcr.io/icub-tech-iit/test-skin-patches:latest
    ```
2. Launch the container:
    ```sh
    $ docker run -it --rm -p 6080:6080 --device=/dev/ttyUSB0 ghcr.io/icub-tech-iit/test-skin-patches:latest
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
