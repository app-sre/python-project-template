FROM registry.access.redhat.com/ubi9/python-312@sha256:5e80833fe6cca33826db27373f1cd119bcc32e9daa26afd6cca7aeae289cf156 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.6@sha256:b1e699368d24c57cda93c338a57a8c5a119009ba809305cc8e86986d4a006754 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
