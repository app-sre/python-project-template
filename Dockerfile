FROM registry.access.redhat.com/ubi9/python-312@sha256:3e4ad0f46732b83be01f57c6df47433c83ca04c9d329f6ddd735a2896880642a AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.3@sha256:8257f3d17fd04794feaf89d83b4ccca3b2eaa5501de9399fa53929843c0a5b55 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
