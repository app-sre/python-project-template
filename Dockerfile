FROM registry.access.redhat.com/ubi9/python-312@sha256:272741b07927f29f14163880af2fd7473479aad4ceb602cdd67e3b1b155e462f AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.9@sha256:cbc016e49b55190e17bfd0b89a1fdc1a54e0a54a8f737dfacc72eca9ad078338 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
