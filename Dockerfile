FROM registry.access.redhat.com/ubi9/python-312@sha256:272741b07927f29f14163880af2fd7473479aad4ceb602cdd67e3b1b155e462f AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.8@sha256:cb641b1979723dc5ab87d61f079000009edc107d30ae7cbb6e7419fdac044e9f /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
