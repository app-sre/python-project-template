FROM registry.access.redhat.com/ubi9/python-312@sha256:5b240af6d5a0e0965b3827c858dc8866875ca80b15abc63499f8e419e4de6aa5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.2@sha256:01ddc2a91588f1210396433c79c9f58848ad668ea05bda895f5a1a31f2e5b64f /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
