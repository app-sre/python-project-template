FROM registry.access.redhat.com/ubi9/python-312@sha256:9d6f32c64224dd7f3a57ae5ad6a2ba62293cdf4e2e85fd3b195475ee19026c33 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.12@sha256:4faec156e35a5f345d57804d8858c6ba1cf6352ce5f4bffc11b7fdebdef46a38 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
