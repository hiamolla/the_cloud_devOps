## Task:

193.16.20.35/29

- What is the Network IP, 

- Number of hosts, 

- Range of IP addresses and 

- Broadcast IP from this subnet?

## Instruction: 

Submit all your answer as a markdown file in the folder for this exercise.

Procedure:

- Determine the number of bits used for subnetting:

The number of bits used for subnetting (n) to their corresponding subnet mask is as follows:


|           subnet mask              | 0 | 128 | 192 | 224 | 240 | 248 | 252 | 254 | 255 |
|------------------------------------|---|-----|-----|-----|-----|-----|-----|-----|-----|
| **no of bits used for subnetting (n)** | **0** | **1**   | **2**   | **3**   |  **4**  |  **5**  |  **6**  | **7**   |  **8**  | 

*Note: subnet mask 255 is default*

Given: 193.16.20.35/29

CIDR = 29. 

- Determine the subnet mask from the given CIDR

29 = 8 + 8 + 8 + 5 
subnet mask = 255.255.255.248

- convert subnet mask to binary

11111111.11111111.11111111.11111000

- Determine the wildcard

subtract the subnet mask from 255.255.255.255 i.e 255.255.255.255 - 255.255.255.248 = 0.0.0.7

- Determine the network ID

given IP 193.16.20.35, convert to binary i.e 193.16.20.35 to binary = 11000001.00010000.00010100.00100011

calculate the binary between the given IP and the subnet mask. i.e

| subnet mask binary | 11111111 | 11111111 | 11111111 | 11111000 |
|--------------------|----------|----------|----------|----------|
| **given IP binary**    | **11000001** | **00010000** | **00010100** | **00100011** |

| binary result      | 11000001 | 00010000 | 00010100 | 00100000 |
|--------------------|----------|----------|----------|----------|
| **decimal result**     | **193**      | **16**       | **20**       | **32**       |

**Network IP address = 193.16.20.32**

- Determine the number of host

number of hosts = 2^x - 2 where x is the number of host ID bits. 

*note: here we determine the host bit in the subnet mask by counting from right and that gives us a total of 3*

Number of hosts = 2^3 - 2 = (2 x 2 x 2) - 2 = 8 - 2 = 6

**Number of hosts = 6**

- Determine the Range of IP addresses and the broadcast

Given IP address: 193.16.20.35/29

Network IP address: 193.16.20.32

Number of hosts: 6

**Range of IP Addresses = 193.16.20.33 - 193.16.20.38**

*where*,

- Minimun range of IP = 193.16.20.33
- Maximum range of IP = 193.16.20.38

**Broadcast IP = 193.16.20.39**





