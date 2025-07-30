FROM registry.access.redhat.com/ubi9/python-312@sha256:95ec8d3ee9f875da011639213fd254256c29bc58861ac0b11f290a291fa04435 AS test
COPY --from=ghcr.io/astral-sh/uv:0.8.4@sha256:40775a79214294fb51d097c9117592f193bcfdfc634f4daa0e169ee965b10ef0 /uv /bin/uv

ENV \
    UV_PYTHON="/usr/bin/python3.12" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY . .
RUN make _test
