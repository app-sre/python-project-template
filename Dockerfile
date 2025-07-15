FROM registry.access.redhat.com/ubi9/python-312@sha256:9b1c6e37a36bd62815e264345ba1345f0edda83c105cf48aba72eecee1ba98d5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.21@sha256:a64333b61f96312df88eafce95121b017cbff72033ab2dbc6398edb4f24a75dd /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
