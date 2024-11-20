FROM registry.access.redhat.com/ubi9/python-312@sha256:d1244378f7ab72506d8d91cadebbf94c893c2828300f9d44aee4678efec62db9 AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.2@sha256:ab5cd8c7946ae6a359a9aea9073b5effd311d40a65310380caae938a1abf55da /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
