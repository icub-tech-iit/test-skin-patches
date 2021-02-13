Test Skin Patches
=================

An automated tool to be used during production stage for testing skin patches.

## Instructions to run the container
Install [Docker](https://www.docker.com) and go through the following steps:
1. Pull the docker image:
    ```sh
    $ docker pull ghcr.io/icub-tech-iit/test-skin-patches:latest
    ```
2. Launch the container:
    ```sh
    $ docker run --name test_skin --rm --network host ghcr.io/icub-tech-iit/test-skin-patches:latest
    ```
3. Open up the browser and connect to **`localhost:6080`** to get to the workspace desktop GUI.
5. Once done, stop the container:
    ```sh
    $ docker stop test_skin
    ```

⚠ In case the desktop GUI stops working, you can start it over:
```sh
$ docker exec test_skin start-vnc-session.sh
```

### 👨🏻‍💻 Maintainers
This repository is maintained by:

| | |
|:---:|:---:|
| [<img src="https://github.com/davidetome.png" width="40">](https://github.com/davidetome) | [@davidetome](https://github.com/davidetome) |
| [<img src="https://github.com/pattacini.png" width="40">](https://github.com/pattacini) | [@pattacini](https://github.com/pattacini) |
