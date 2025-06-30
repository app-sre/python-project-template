FROM registry.access.redhat.com/ubi9/python-312@sha256:2049a086cccdabf5608cbdc9cd022f3e54d2344f7e11dc156f6f3fa0f5a3c9b6 AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.17@sha256:68a26194ea8da0dbb014e8ae1d8ab08a469ee3ba0f4e2ac07b8bb66c0f8185c1 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
