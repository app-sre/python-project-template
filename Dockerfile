FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:1f0d7848ed6c8f9e051ff14675ffcc8c98eaf2a66fc7a473d20ba8a4efefc408 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.12@sha256:73d2665b478d8fa2de1cf105c6841f8e9cb6b09e568fc7700440c09f8fcd7ac4 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
