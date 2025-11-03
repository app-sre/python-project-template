FROM registry.access.redhat.com/ubi9/python-312@sha256:cb038ff3c10b5cccbfe56f6ebecc2106e359d112ec18eda5dfe299d474b06457 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.7@sha256:ba4857bf2a068e9bc0e64eed8563b065908a4cd6bfb66b531a9c424c8e25e142 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
