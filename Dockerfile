FROM registry.access.redhat.com/ubi9/python-312@sha256:f90710e94f67ec27e1f91de9851a3b9bf34e786a1ad3b567c2a39e0867cf00b5 AS test
COPY --from=ghcr.io/astral-sh/uv:0.9.16@sha256:ae9ff79d095a61faf534a882ad6378e8159d2ce322691153d68d2afac7422840 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
