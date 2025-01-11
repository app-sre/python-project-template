FROM registry.access.redhat.com/ubi9/python-312@sha256:fc3f913ca976d1f04ea1cbf75d5b0026bbf07befc31f0aa67dc3bf211a43cca8 AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.18@sha256:e2101b9e627153b8fe4e8a1249cc4194f1b38ece7f28a5a9b8f958e3b560e69c /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
