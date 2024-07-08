#source: https://www.open3d.org/docs/release/docker.html#headless-rendering
FROM ubuntu:20.04
RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    libegl1 libgl1 libgomp1 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Open3D from the PyPI repositories
RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade open3d==0.18.0

# Configure Mesa EGL for headless rendering
ENV EGL_PLATFORM=surfaceless
WORKDIR /root/