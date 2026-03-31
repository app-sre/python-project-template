FROM registry.access.redhat.com/ubi9/python-312@sha256:46f883684d02cef2a7abb0c4124f18308ad920018d76c5c56f130dae02bfed05 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.2@sha256:c4f5de312ee66d46810635ffc5df34a1973ba753e7241ce3a08ef979ddd7bea5 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
