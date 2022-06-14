# docker-cs1.6

### based on
- [https://github.com/CM2Walki/TF2](https://github.com/CM2Walki/TF2)
- [https://github.com/febLey/counter-strike_server](https://github.com/febLey/counter-strike_server)

## How to run this docker

Running on the *host* interface (recommended):<br/>
```console
$ docker run -d -it --net=host --name=cs1.6-dedicated agekara/docker-cs1.6
```

Running using a bind mount for data persistence on container recreation:
```console
$ mkdir -p $(pwd)/cs1.6-data
$ chmod 777 $(pwd)/cs1.6-data # Makes sure the directory is writeable by the unprivileged container user
$ docker run -d -it --net=host -v $(pwd)/cs1.6-data:/home/steam/cs1.6-dedicated/ --name=cs1.6-dedicated agekara/docker-cs1.6
```

Running multiple instances (increment HLDS_PORT):
```console
$ docker run -d -it --net=host --name=cs1.6-dedicated2 -e HLDS_PORT=27016 agekara/docker-cs1.6
```