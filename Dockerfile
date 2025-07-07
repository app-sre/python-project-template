FROM registry.access.redhat.com/ubi9/python-312@sha256:0435cf210f79117b3e273ca8e411014f9774f85f4edaf2133972fa0cbb17afb4 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.19@sha256:2dcbc74e60ed6d842122ed538f5267c80e7cde4ff1b6e66a199b89972496f033 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
