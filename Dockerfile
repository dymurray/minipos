FROM fedora:27
COPY minipos /usr/bin/
RUN yum -y update
RUN yum -y install python3-qrcode python3-pillow python-urllib3 git python-setuptools
RUN git clone https://github.com/richardkiss/pycoin && cd pycoin && python setup.py install
WORKDIR /home/minipos
ADD . /home/minipos
ENTRYPOINT ["/home/minipos/minipos"]
