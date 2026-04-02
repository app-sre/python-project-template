FROM registry.access.redhat.com/ubi9/python-312@sha256:9c89d8b9ee261647a2a0020feab6281cb6675ca11038e65ec6dd20b46975b444 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.3@sha256:90bbb3c16635e9627f49eec6539f956d70746c409209041800a0280b93152823 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
