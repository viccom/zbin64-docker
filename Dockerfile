FROM ubuntu:20.04
LABEL version="1.0" description="zbin64" by="viccom"
ENV SZPLATPATH /zbin64
WORKDIR $SZPLATPATH
RUN apt update \
	&& apt install wget -y \
	&& apt install unzip -y \
    && wget -O /tmp/zbin64.tar.gz "https://symtech.oss-cn-beijing.aliyuncs.com/szplat/zbin64.tar.gz" \
    && tar -zxvf /tmp/zbin64.tar.gz -C / \
    && ln -s /zbin64/libiconv.so.2 /lib/libiconv.so.2 \
    && rm -f /tmp/zbin64.tar.gz

EXPOSE 5180/tcp 5191/tcp 6181/tcp 6190/tcp 2404/tcp 5181/udp 5190/udp 5192/udp

CMD ["/zbin64/SZDaemon.ex"]
