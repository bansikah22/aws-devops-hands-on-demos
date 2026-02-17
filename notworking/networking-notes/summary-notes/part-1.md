# Networking Fundamentals

**Date**: 13/10/2026 | **Instructor**: Alan

## What is a Network?

A network is a group of connected devices that can share resources or access the internet.

## Types of Networks

### PAN (Personal Area Network)
- Designed for close proximity (e.g., smartphones, Bluetooth)
- Range: ~10 meters
- User devices in immediate personal space

### LAN (Local Area Network)
- Devices connected within a single specific location (e.g., a building)
- Can be wired or wireless
- Examples: home, school, or small office networks

### WLAN (Wireless LAN)
- Wireless version of LAN
- Uses Wi-Fi technology

### WAN (Wide Area Network)
- Connects multiple cities or locations
- Managed by an ISP (Internet Service Provider)
- Connects networks across large distances

### Internet
- Global system connecting millions of networks
- Enables access to email, file transfer, web services, etc.

### Network Scale Comparison

```mermaid
graph LR
    PAN["PAN<br/>(~10m)"] --> LAN["LAN<br/>(Building)"]
    LAN --> WAN["WAN<br/>(Cities)"]
    WAN --> Internet["Internet<br/>(Global)"]
```

---

## Network Models

### Peer-to-Peer (P2P)
- Devices connect directly (no central server needed)
- Perfect for file sharing
- Decentralized architecture

### Client-Server
- Uses a central server
- Multiple clients connect to access/share resources
- Examples: Netflix, Zoom, file servers
- Works well in both LANs and WANs

### Network Models Comparison

```mermaid
graph TD
    subgraph P2P["Peer-to-Peer Model"]
        direction LR
        P1[Device 1] <--> P2[Device 2]
        P2 <--> P3[Device 3]
        P1 <--> P3
    end
    
    subgraph CS["Client-Server Model"]
        direction TB
        Server[Central Server]
        C1[Client 1] --> Server
        C2[Client 2] --> Server
        C3[Client 3] --> Server
        Server --> C1
        Server --> C2
        Server --> C3
    end
```