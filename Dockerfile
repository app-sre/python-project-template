FROM registry.access.redhat.com/ubi9/python-312@sha256:22e5e173c8d702590864f4bf2fef10789f8ff2c308a16cd474cc5f7b8ab41eb2 AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.17@sha256:4a6c9444b126bd325fba904bff796bf91fb777bf6148d60109c4cb1de2ffc497 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
