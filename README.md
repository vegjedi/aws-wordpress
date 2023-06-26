![wp drawio](https://github.com/vegjedi/aws-wordpress/assets/69030924/7543456c-9653-47f6-b703-3a982254f642)

Bid farewell to unreliable all-in-one LAMP servers for WordPress. Our new solution ensures high availability by deploying across multiple Availability Zones with Auto Scaling for failover.

The newly designed architecture is supported by a high-availability RDS database and a robust EFS file system, which will seamlessly connect to WordPress instances in the Auto Scaling Group. We will further optimize performance with RDS Read Replica and ElastiCache for speedy database access and content caching.

We will place all critical resources in private subnets for security and only allow connections from trusted AWS resources. A resilient Application Load Balancer will distribute traffic to secured WordPress servers. To improve load time and enforce SSL connections, we will utilize CloudFront and even connect WordPress with our own domain via Route 53.

Lastly, for server maintenance, in each public subnet, we will place a Bastion host for SSH access and another NAT Gateway to allow Internet connection/updates for WordPress instances well-protected behind in the private subnet.

For step-by-step instruction, please use this link https://medium.com/@vcoder/highly-available-and-secured-wordpress-on-aws-a-comprehensive-guide-56cbf7808a35
