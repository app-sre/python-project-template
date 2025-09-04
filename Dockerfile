FROM registry.access.redhat.com/ubi9/python-312@sha256:83b01cf47b22e6ce98a0a4802772fb3d4b7e32280e3a1b7ffcd785e01956e1cb AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.15@sha256:a5727064a0de127bdb7c9d3c1383f3a9ac307d9f2d8a391edc7896c54289ced0 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
