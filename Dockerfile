FROM cloudbees/jnlp-slave-with-java-build-tools

USER root

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
  gettext openssl xmlstarlet xz-utils locales \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER jenkins

ENTRYPOINT ["/opt/bin/entry_point.sh", "/usr/local/bin/jenkins-slave"]