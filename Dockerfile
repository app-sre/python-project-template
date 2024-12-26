FROM registry.access.redhat.com/ubi9/python-312@sha256:6efa8f7a469fccd5d8ee716688934e7d2240054c08db9d482d1d2d9a322500cd AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.12@sha256:e244215e69a1b4bfaa41625af047d8d2f94bcee5de308bf31f1edd4253b7efaa /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
