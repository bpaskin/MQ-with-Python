### Python with PyMQI with MQClient in a container

---

Requires to download the MQClient libraries, which can be obtained from [IBM Fix Central](http://ibm.biz/mq93clients).  

1. Download the lastest version of the MQC UbuntuLinuxX64 and place it in the same directory as the Dockerfile.
2. Update the `ARG` in the Dockfile with the name of the file that was downloaded
3. If the sample.py file is going to be used, update the QMGR name, host name, and Queue name.
4. If using another Python file, then update the `COPY` and `ENTRYPOINT` statements in the Dockerfile.
5. Build the image:
```
podman/docker build -t pymq:9.4.3.1 .
```
6. Run the container
```
podman/docker run --name pymq pymq:9.4.3.1
```
