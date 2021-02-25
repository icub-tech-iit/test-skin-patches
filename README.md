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

## Instructions to test the skin
Connect the `ESD USB/CAN` interface to the host machine, then :
```sh
    $ sudo ip link set can0 type can bitrate 1000000
    $ sudo ip link set up can0
```
Inside the docker run :
```sh
    $ yarpserver
    $ yarp run --server /icubsrv
    $ yarprobotinterface --config <skin_part_.xml>
    $ yarpmanager
```
In the yarpmanager GUI :
- Select `Entities` -> `Applications` -> `SkinGui_All_V2`
- Run `skinManager` and `skinManagerGui`
- Connect the port correspondig to the part to be testsed (in thi example `left_arm`)

![test-skin](./assets/test-skin.png)

Now touch the skin and you'll se the part touched highlighted in the
 
### 👨🏻‍💻 Maintainers
This repository is maintained by:

| | |
|:---:|:---:|
| [<img src="https://github.com/davidetome.png" width="40">](https://github.com/davidetome) | [@davidetome](https://github.com/davidetome) |
| [<img src="https://github.com/pattacini.png" width="40">](https://github.com/pattacini) | [@pattacini](https://github.com/pattacini) |
