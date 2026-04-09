FROM registry.access.redhat.com/ubi9/python-312@sha256:5e80833fe6cca33826db27373f1cd119bcc32e9daa26afd6cca7aeae289cf156 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.5@sha256:555ac94f9a22e656fc5f2ce5dfee13b04e94d099e46bb8dd3a73ec7263f2e484 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
