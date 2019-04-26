# Devops Repo LES

## Server Info
1. Droplet = 35.198.188.139 | les.viter.dk
2. Staging = staging.viter.dk & Prod = les.viter.dk

## Frontend
1. Prod = port 80
2. Staging = port 8080

## Backend
1. Prod = port 3000
2. Staging = port 3030

## Mysql Info
| Username       | Staging-Read | Staging-Write | Staging-Delete | Prod-Read | Prod-Write | Prod-Delete | Admin Stuff |
|----------------|--------------|---------------|----------------|-----------|------------|-------------|-------------|
| staging-reader | x            |               |                |           |            |             |             |
| prod-reader    |              |               |                | x         |            |             |             |
| staging-writer | x            | x             | x              |           |            |             |             |
| prod-writer    |              |               |                | x         | x          | x           |             |
| superadmin     | x            | x             | x              | x         | x          | x           | x           |

## Temp 
`GRANT SELECT, INSERT, UPDATE, DELETE ON prod.* TO 'prod-writer'@'%'; `
