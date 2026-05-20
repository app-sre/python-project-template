FROM registry.access.redhat.com/ubi9/python-312@sha256:742c950d2263ca2a42ea82ef0182eaa0bb98c653ab891bb6c190c728fa722eb1 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.15@sha256:e590846f4776907b254ac0f44b5b380347af5d90d668138ca7938d1b0c2f98d3 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
