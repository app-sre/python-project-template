FROM registry.access.redhat.com/ubi9/python-312@sha256:14455dd3c5be0bcb592ae72a63d914e0caa4ea6132db30ab9c2de84f886e786c AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.0@sha256:63b7453435641145dc3afab79a6bc2b6df6f77107bec2d0df39fd27b1c791c0a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
