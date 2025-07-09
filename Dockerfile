FROM registry.access.redhat.com/ubi9/python-312@sha256:9b1c6e37a36bd62815e264345ba1345f0edda83c105cf48aba72eecee1ba98d5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.20@sha256:2fd1b38e3398a256d6af3f71f0e2ba6a517b249998726a64d8cfbe55ab34af5e /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
