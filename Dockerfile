FROM registry.access.redhat.com/ubi9/python-312@sha256:d9637eab5b8f44d754fa2c7ffeb546bfb27894c700f2e3a8a5705b44a70313cc AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.5@sha256:dc60491f42c9c7228fe2463f551af49a619ebcc9cbd10a470ced7ada63aa25d4 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
