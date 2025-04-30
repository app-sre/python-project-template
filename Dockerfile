FROM registry.access.redhat.com/ubi9/python-312@sha256:cf70b25ffec80e5b0e7dae192a6ab181af877ed27c24dbcce6bec6e9238f994c AS test
COPY --from=ghcr.io/astral-sh/uv:0.7.2@sha256:3b898ca84fbe7628c5adcd836c1de78a0f1ded68344d019af8478d4358417399 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
