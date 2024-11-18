FROM registry.access.redhat.com/ubi9/python-312@sha256:c91642bdeddb1542f7081bc7846926f7741f75be4f35ef33f8908c1db236c10b AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.2@sha256:ab5cd8c7946ae6a359a9aea9073b5effd311d40a65310380caae938a1abf55da /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
