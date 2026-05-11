FROM registry.access.redhat.com/ubi9/python-312@sha256:6509cd88e7886d0ab41c8edda8a13acba2b3eaad56160fa86f0e4b27abb82dca AS test
COPY --from=ghcr.io/astral-sh/uv:0.11.13@sha256:841c8e6fe30a8b07b4478d12d0c608cba6de66102d29d65d1cc423af86051563 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
