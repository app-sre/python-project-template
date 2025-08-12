FROM registry.access.redhat.com/ubi9/python-312@sha256:8cf2ed9f376631e82a38e1b680332f7fda2955df61803ba660734559a8ed33d1 AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.9@sha256:cda9608307dbbfc1769f3b6b1f9abf5f1360de0be720f544d29a7ae2863c47ef /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
