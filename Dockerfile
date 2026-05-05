FROM registry.access.redhat.com/ubi9/python-312@sha256:12662c50b0ce52c5a5f43724c9c588c6cbe9be98521f4e3f4112ab01a7becbe5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.9@sha256:6b6fa841d71a48fbc9e2c55651c5ad570e01104d7a7d701f57b2b22c0f58e9b1 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
