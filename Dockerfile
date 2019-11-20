ARG SRC_IMG=uplain-osu-benchmark
FROM qnib/${SRC_IMG}

ARG EFA_VER=1.6.2
ARG EFA_URL=https://s3-us-west-2.amazonaws.com/aws-efa-installer

RUN apt-get update \
 && apt install -y curl
RUN mkdir -p /opt/aws-efa-installer \
 && cd /opt/aws-efa-installer \
 && curl -O https://s3-us-west-2.amazonaws.com/aws-efa-installer/aws-efa-installer-1.7.0.tar.gz \
 && tar xfz aws-efa-installer-1.7.0.tar.gz --strip-components=1 \
 && ./efa_installer.sh -y --skip-kmod --no-verify \
 && cd /root/ \
 && rm -rf /opt/aws-efa-installer
 #&& wget -qO- ${EFA_URL}/aws-efa-installer-${EFA_VER}.tar.gz |tar xfz - -C /opt/aws-efa-installer --strip-components=1
WORKDIR /usr/local/libexec/osu-micro-benchmarks/mpi/pt2pt/
