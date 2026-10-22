FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:8114f8e3f19a4d5b0cc2f0022e409dee5f296d69207aa489a892c01b8ab4a17f AS test
COPY --from=ghcr.io/astral-sh/uv:0.13.4@sha256:9f130421e930bfbdc563c00740466603f8723158e90297d07957c2294640262b /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
