# Network Services

Network services are applications that run on a network and provide functionality to users and other applications. They are the reason we use networks.

## Common Network Services

# Network Services

Network services are applications that run on a network and provide functionality to users and other applications. They are the reason we use networks.

## Common Network Services

*   **DNS (Domain Name System):** Think of DNS as the phone book of the internet. Humans access information online through domain names, like `google.com` or `amazon.com`. Web browsers, however, interact through Internet Protocol (IP) addresses. DNS translates domain names to IP addresses so browsers can load internet resources. Each device connected to the internet has a unique IP address which other machines use to find the device. DNS servers eliminate the need for humans to memorize IP addresses such as `192.168.1.1` (in IPv4), or more complex newer alphanumeric IP addresses such as `2400:cb00:2048:1::c629:d7a2` (in IPv6).

*   **DHCP (Dynamic Host Configuration Protocol):** Imagine you're at a hotel. When you connect to the Wi-Fi, the hotel's network doesn't give you a permanent, dedicated connection that you can use every time you visit. Instead, it assigns you a temporary room key that works for the duration of your stay. DHCP works in a similar way. When a device connects to a network, a DHCP server automatically assigns it a temporary IP address from a pool of available addresses. This is much more efficient than manually assigning a permanent IP address to every device that might ever connect to the network.

*   **NAT (Network Address Translation):** Think of NAT as a receptionist at a large company. If you want to talk to an employee, you call the company's main number (the public IP address) and the receptionist (the router) connects you to the employee's extension (the private IP address). In the same way, NAT allows multiple devices on a local network to share a single public IP address. This is essential because there are not enough IPv4 addresses for every device in the world to have its own public IP address.

*   **NTP (Network Time Protocol):** Imagine a world where every clock showed a different time. It would be chaos! NTP is like the official timekeeper for the internet. It's a protocol used to synchronize the clocks of computers to some time reference. This is important for many applications, such as financial transactions, and for logging events in a distributed system.

*   **QoS (Quality of Service):** Think of QoS as the express lane on a highway. On a busy network, some types of traffic are more important than others. For example, a video call is more sensitive to delays than an email. QoS is a set of technologies that allows a network administrator to prioritize certain types of traffic over others, ensuring that the most important applications get the bandwidth they need to run smoothly.

These services are essential for the functioning of modern networks and the internet.