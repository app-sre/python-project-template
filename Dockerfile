FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:39659b2e2f54adcdbe66315e10edae56e9a7c79ac6e798edebba340535c9c4a3 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.17@sha256:10787c682e4184e4f290de1171fd4703dc63de99221f10fe1c99002ce7fa9acc /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
