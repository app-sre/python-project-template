FROM registry.access.redhat.com/ubi10/python-314-minimal@sha256:1f0d7848ed6c8f9e051ff14675ffcc8c98eaf2a66fc7a473d20ba8a4efefc408 AS test
COPY --from=ghcr.io/astral-sh/uv:0.12.13@sha256:b485bd65cc2cf1c9a93b3554012c9c3778cf7b1b5fd3d3096ce9e1226c97e1e6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.14" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

USER root
RUN microdnf install -y make
USER 1001

COPY . .
RUN make _test
