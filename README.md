# docker-ubuntu-svn1.7
A docker image to get an svn 1.7 client

# Build and Run
Build the image, and open a container based on this image, and mount the directory of your SVN 1.7 project to a specific directory on the container.
```
docker build -t docker-ubuntu-svn1.7 .
docker run -it -v <your svn 1.7 project>:/home/ubuntu/svnproject docker-ubuntu-svn1.7
```

Inside the docker container:
```
root@efe3c08397ac:/# svn --version
root@efe3c08397ac:/# cd /home/ubuntu/svnproject
root@efe3c08397ac:/# svn log
```

It works :)
You can interract with your project with a SVN 1.7 client.
