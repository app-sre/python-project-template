FROM registry.access.redhat.com/ubi9/python-312@sha256:258610a5d3dd6cc5badc222a7052ed3a5f11cf837f1f2a0fb3fcc13f736ae03a AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.9@sha256:ba36ea627a75e2a879b7f36efe01db5a24038f8d577bd7214a6c99d5d4f4b20c /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
