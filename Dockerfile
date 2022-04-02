# 基础镜像层🪞
From node

# 每个标签其实是一个键值对（Key-Value），在一个镜像当中可以通过增加标签的方式来为镜像添加自定义元数据
LABEL maintainer="ljjkerwin@gmail.com"
LABEL github="ljjkerwin"

# 🪞
RUN echo 'run some command'

# 🪞
# 将应用相关文件从构建上下文复制到了当前镜像中
COPY . /project

# 为 Dockerfile 中尚未执行的指令设置工作目录
# 该目录与镜像相关，并且会作为元数据记录到镜像配置中，但不会创建新的镜像层
WORKDIR /project

# 🪞
RUN npm install

# 因为当前应用需要通过 TCP 端口 8080 对外提供一个 Web 服务，所以在 Dockerfile 中通过 EXPOSE 8080 指令来完成相应端口的设置。
# 这个配置信息会作为镜像的元数据被保存下来，并不会产生新的镜像层
EXPOSE 3000

# 通过 ENTRYPOINT 指令来指定当前镜像的入口程序。ENTRYPOINT 指定的配置信息也是通过镜像元数据的形式保存下来，而不是新增镜像层。
ENTRYPOINT ["node", "./index.js", "test"]