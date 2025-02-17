FROM registry.access.redhat.com/ubi9/python-312@sha256:14455dd3c5be0bcb592ae72a63d914e0caa4ea6132db30ab9c2de84f886e786c AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.1@sha256:90daa0b4d74ea55c7b8e06d25d3826b1eac66e7994387248e6173dd2b66668e2 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
