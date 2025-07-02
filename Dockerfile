FROM registry.access.redhat.com/ubi9/python-312@sha256:81ecc946acac7523ab3c7fe10ca4cf7db29bb462c2ab5c6c57c7b57d39f38b19 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.18@sha256:1bf08b18814f11cc37b5a1566c11570b4bf660f59225cd4e0f3b18d9fb04c277 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
