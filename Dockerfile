FROM registry.access.redhat.com/ubi9/python-312@sha256:a370a755dd6a9a5697876e7a5ecb390c3cc528142e222116ad5fab6d71ba35f9 AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.3@sha256:90bbb3c16635e9627f49eec6539f956d70746c409209041800a0280b93152823 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
