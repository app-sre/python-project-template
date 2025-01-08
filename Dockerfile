FROM registry.access.redhat.com/ubi9/python-312@sha256:fc3f913ca976d1f04ea1cbf75d5b0026bbf07befc31f0aa67dc3bf211a43cca8 AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.15@sha256:ea861f8e28b5c0e85ec14dc0f367d9d5cfa5b418024cc250219288d4fff591f1 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
