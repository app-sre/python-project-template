FROM registry.access.redhat.com/ubi9/python-312@sha256:3e4ad0f46732b83be01f57c6df47433c83ca04c9d329f6ddd735a2896880642a AS test
COPY --from=ghcr.io/astral-sh/uv:0.6.6@sha256:031ddbc79275e351a43cbb66f64d8cd314cc78c3878898f4ab4f147b092e8e2d /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
