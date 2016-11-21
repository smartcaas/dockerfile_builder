FROM golang:1.6
RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/smartcaas/builder.git \
&& cd builder \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/builder/
COPY app.conf $GOPATH/src/github.com/dinp/builder/conf/app.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN ln -s /lib/x86_64-linux-gnu/libdevmapper.so.1.02.1 /lib/x86_64-linux-gnu/libdevmapper.so.1.02
CMD ["/run.sh"]
