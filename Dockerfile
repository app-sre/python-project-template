FROM registry.access.redhat.com/ubi9/python-312@sha256:5b240af6d5a0e0965b3827c858dc8866875ca80b15abc63499f8e419e4de6aa5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.1@sha256:90daa0b4d74ea55c7b8e06d25d3826b1eac66e7994387248e6173dd2b66668e2 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
