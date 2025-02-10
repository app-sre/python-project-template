FROM registry.access.redhat.com/ubi9/python-312@sha256:14455dd3c5be0bcb592ae72a63d914e0caa4ea6132db30ab9c2de84f886e786c AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.29@sha256:88d7b48fc9f17462c82b5482e497af250d337f3f14e1ac97c16e68eba49b651e /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
