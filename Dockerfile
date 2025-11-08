FROM registry.access.redhat.com/ubi9/python-312@sha256:7b8f2ee184b40eb160e2c90c240a16fd9ec93279cc1553c0b8b872e2274a139b AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.8@sha256:08f409e1d53e77dfb5b65c788491f8ca70fe1d2d459f41c89afa2fcbef998abe /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
