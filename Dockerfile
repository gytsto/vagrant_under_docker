# Use Ubuntu Jammy as base image
FROM ubuntu:jammy as base

# Set systemd as entrypoint
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Install necessary packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    wget \
    git \
    gnupg \
    lsb-release \
    nfs-common \
    nfs-kernel-server \
    openssh-server \
    sudo \
    ufw \
    build-essential \
    rsync \
    dumb-init \
    && rm -rf /var/lib/apt/lists/*

# Install Vagrant
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update -y \
    && apt-get install -y vagrant=2.4.1-1

# Install libvirt and related packages
RUN apt-get install -y \
    libvirt-clients \
    libvirt-daemon-system \
    qemu-kvm bridge-utils \
    dnsmasq \
    libvirt-dev \
    virt-manager

# Install vagrant-libvirt plugin
RUN vagrant plugin install vagrant-libvirt
