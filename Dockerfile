FROM registry.access.redhat.com/ubi9/python-312@sha256:6efa8f7a469fccd5d8ee716688934e7d2240054c08db9d482d1d2d9a322500cd AS test
COPY --from=ghcr.io/astral-sh/uv:0.5.13@sha256:ea61e006cfec0e8d81fae901ad703e09d2c6cf1aa58abcb6507d124b50286f9f /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
