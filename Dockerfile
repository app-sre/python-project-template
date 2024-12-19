FROM registry.access.redhat.com/ubi9/python-312@sha256:6efa8f7a469fccd5d8ee716688934e7d2240054c08db9d482d1d2d9a322500cd AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.10@sha256:e4c08963c249b0e07d88e9313374d00491e69eed0c99ca5ee443e5c234a16a38 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
