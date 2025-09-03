FROM registry.access.redhat.com/ubi9/python-312@sha256:83b01cf47b22e6ce98a0a4802772fb3d4b7e32280e3a1b7ffcd785e01956e1cb AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.15@sha256:1eca97b33175f9c0896ec34f30e03ba0227efd8e38a9a0f6d12c6003eacb6faa /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
