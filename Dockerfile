FROM kbase/kbase:sdkbase.latest
MAINTAINER KBase Developer
# Install the SDK (should go away eventually)
RUN df -h
RUN \
  . /kb/dev_container/user-env.sh && \
  cd /kb/dev_container/modules && \
  rm -rf jars && \
  git clone https://github.com/kbase/jars && \
  rm -rf kb_sdk && \
  git clone https://github.com/kbase/kb_sdk -b develop && \
  rm -rf transform && \
  git clone https://github.com/kbase/transform && \
  rm -rf coex_helper && \
  git clone https://github.com/sjyoo/coex_helper && \
  cd /kb/dev_container/modules/jars && \
  make deploy && \
  cd /kb/dev_container/modules/kb_sdk && \
  make && make deploy && \
  cd /kb/dev_container/modules/coex_helper && \
  make update-R && \
  cd /kb/dev_container/modules/transform 
#  make && make deploy 

####END OF KBASE #############################
#apt-get update && apt-get install -y ant && \
# -----------------------------------------
# Insert apt-get instructions here to install
# any required dependencies for your module.
# -----------------------------------------

RUN \
  apt-get update && \
  apt-get install -y bzip2 \
                     gcc \
		     ncurses-dev \
		     tofrodos \
		     unzip 
RUN pip install mpipe
RUN pip install pandas numpy
WORKDIR /kb/module
COPY ./deps /kb/deps
COPY ./ /kb/module
# Windows compatibility line
#RUN bash -c "for i in `find . -name '*.sh'`; do dos2unix -v $i; done"
RUN \
  . /kb/dev_container/user-env.sh && \
  cd /kb/module && \
  make update-R 
RUN \
  . /kb/dev_container/user-env.sh && \
  cd /kb/module && \
  make && make deploy
#  rm -rf narrative_method_store \
ENV PATH=$PATH:/kb/dev_container/modules/kb_sdk/bin
WORKDIR /kb/module
RUN mkdir -p /kb/module/work
ENTRYPOINT [ "./scripts/entrypoint.sh" ]
CMD [ ]
