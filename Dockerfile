FROM registry.access.redhat.com/ubi9/python-312@sha256:fc9702e64d88c030b19b2298a5b6604bd2a5ac9f210833691cdaac3a43e29a2d AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.11@sha256:8101ad825250a114e7bef89eefaa73c31e34e10ffbe5aff01562740bac97553c /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
