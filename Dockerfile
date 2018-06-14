FROM fedora:27
COPY minipos /usr/bin/
RUN yum -y update
RUN yum -y install python3-qrcode python3-pillow python-urllib3 git python-setuptools sendmail
RUN mkdir -p /usr/local/lib/python3.6/site-packages/
RUN git clone https://github.com/richardkiss/pycoin && cd pycoin && git checkout 0.80 && python3 setup.py install
WORKDIR /home/minipos
RUN chmod 777 /home/minipos
ADD . /home/minipos
ENTRYPOINT ["/home/minipos/entrypoint.sh"]
