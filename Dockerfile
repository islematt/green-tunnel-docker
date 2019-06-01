FROM crowjdh/fast-ubuntu:18.04
LABEL maintainer="crowjdh@gmail.com"

ENV dev_dir /usr/dev

RUN apt-get update && apt-get install xz-utils

COPY files/node-v9.10.1-linux-x64.tar.xz ${dev_dir}/node-v9.10.1-linux-x64.tar.xz
RUN tar -C /usr/local --strip-components 1 -xJf ${dev_dir}/node-v9.10.1-linux-x64.tar.xz

RUN npm install -g green-tunnel

EXPOSE 8090

ENTRYPOINT ["gt"]
CMD ["--ip", "0.0.0.0", "--port", "8090"]

