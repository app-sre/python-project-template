FROM registry.access.redhat.com/ubi9/python-312@sha256:922b96792082cdd07eaeae176afd7e11b353f9b30c9132f5b842089591de12b7 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.22@sha256:2320e6c239737dc73cccce393a8bb89eba2383d17018ee91a59773df802c20e6 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
