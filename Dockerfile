FROM registry.access.redhat.com/ubi9/python-312@sha256:e58da77627d3cd889c1fe862bac08f96da1698d0cff8e5e233d67aa9fd0083b5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.21@sha256:15f68a476b768083505fe1dbfcc998344d0135f0ca1b8465c4760b323904f05a /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
