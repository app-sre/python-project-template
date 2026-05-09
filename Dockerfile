FROM registry.access.redhat.com/ubi9/python-312@sha256:21739f35258f21e23a7e02e79c763f2a69e605416fedd54b6ec9c5ef68fd1f43 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.12@sha256:3a59a3cdd5f7c217faa36e32dbc7fddbb0412889c2a0a5229f6d790e5a019dd7 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
