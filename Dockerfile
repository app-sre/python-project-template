FROM registry.access.redhat.com/ubi9/python-312@sha256:4b1e2966220cc31099a95b65f2ed1b94a419156269afffe5e842544b54de1109 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.2@sha256:c4f5de312ee66d46810635ffc5df34a1973ba753e7241ce3a08ef979ddd7bea5 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
