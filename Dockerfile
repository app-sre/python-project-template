FROM registry.access.redhat.com/ubi9/python-312@sha256:e151f5a3319d75dec2a7d57241ba7bb75f1b09bc3f7092d7615ea9c5aedb114c AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.11@sha256:5aa820129de0a600924f166aec9cb51613b15b68f1dcd2a02f31a500d2ede568 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
