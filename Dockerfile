FROM registry.access.redhat.com/ubi9/python-312@sha256:e26b5da8ec538a1467a80c0bb3dff809e04b9733739ba2fd381f2669b206f38c AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.23@sha256:22f6ca040d3f5484d9d792b8de122bb8846760cd997edc73443bc03815cf0a01 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
