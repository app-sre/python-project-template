FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:b352edeb3078ccaf7a9ed38dcc0ce7a5cc6923403eb2ae69f126859cb9a0dcd3 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.1@sha256:cf4eedcaa81655197f625739489effcbe71b61ceb1506f332c3facae5deceded /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
