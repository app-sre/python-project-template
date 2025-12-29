FROM registry.access.redhat.com/ubi9/python-312@sha256:e58da77627d3cd889c1fe862bac08f96da1698d0cff8e5e233d67aa9fd0083b5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.19@sha256:e614684f5327b44f2c3ef3958c5c121f4a8acb8ee5726207470526e42f4b49b8 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
