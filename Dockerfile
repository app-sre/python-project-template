FROM registry.access.redhat.com/ubi9/python-312@sha256:e58da77627d3cd889c1fe862bac08f96da1698d0cff8e5e233d67aa9fd0083b5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.20@sha256:81f1a183fbdd9cec1498b066a32f0da043d4a9dda12b8372c7bfd183665e485d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
