# PostgreSQL Client Docker Image

Lightweight PostgreSQL client Docker images for **versions 12 to 17**, based on **Alpine Linux**.  
These images provide essential PostgreSQL tools like:
- `psql` (PostgreSQL interactive shell)
- `pg_dump` (Backup utility)
- `pg_restore` (Restore utility)
- `pg_isready` (Check server availability)

## 📌 Why Use This Image?
✅ **Lightweight**: Uses **Alpine Linux** to keep the image small (~5-10MB).  
✅ **No Bloat**: Installs **only** the PostgreSQL client tools (no server).  
✅ **Multiple Versions**: Available for **PostgreSQL 12, 13, 14, 15, 16, 17**.  
✅ **Easy to Use**: Run `psql` commands **without installing PostgreSQL locally**.  
✅ **Cross-Platform**: Works on any system with **Docker**.

---

## 🚀 How to Use

### **1️⃣ Pull a Specific Version**
Replace `<VERSION>` with **12, 13, 14, 15, 16, or 17**:
```sh
docker pull dattm24/postgresql-client:<VERSION>
```
Example:
```sh
docker pull dattm24/postgresql-client:17
```

---

### **2️⃣ Run Interactive `psql` Shell**
Connect to a PostgreSQL database:
```sh
docker run --rm -it dattm24/postgresql-client:<VERSION> \
    psql -h <DB_HOST> -p <DB_PORT> -U <USERNAME> -d <DATABASE>
```
Example:
```sh
docker run --rm -it dattm24/postgresql-client:17 \
    psql -h 192.168.10.12 -p 5435 -U db_master -d learning_postgres
```

> You'll be prompted for the password. To pass it automatically, use `-e PGPASSWORD=<PASSWORD>`.

---

### **3️⃣ Run a Query in One Command**
You can execute queries **without opening the interactive shell**:
```sh
docker run --rm -it dattm24/postgresql-client:<VERSION> \
    psql -h <DB_HOST> -p <DB_PORT> -U <USERNAME> -d <DATABASE> -c "SELECT version();"
```
Example:
```sh
docker run --rm -it dattm24/postgresql-client:17 \
    psql -h 192.168.10.12 -p 5435 -U db_master -d learning_postgres -c "SELECT * FROM countries LIMIT 10;"
```

---

## 🔄 Database Backup & Restore

### **Backup a Database (`pg_dump`)**
```sh
docker run --rm dattm24/postgresql-client:<VERSION> \
    pg_dump -h <DB_HOST> -p <DB_PORT> -U <USERNAME> -d <DATABASE> > backup.sql
```
Example:
```sh
docker run --rm dattm24/postgresql-client:17 \
    pg_dump -h 192.168.10.12 -p 5435 -U db_master -d learning_postgres > backup.sql
```

### **Restore a Database (`pg_restore`)**
```sh
cat backup.sql | docker run --rm -i dattm24/postgresql-client:<VERSION> \
    psql -h <DB_HOST> -p <DB_PORT> -U <USERNAME> -d <DATABASE>
```
Example:
```sh
cat backup.sql | docker run --rm -i dattm24/postgresql-client:17 \
    psql -h 192.168.10.12 -p 5435 -U db_master -d learning_postgres
```

---

## 🔍 Check Database Connection (`pg_isready`)
You can check if a PostgreSQL server is reachable:
```sh
docker run --rm dattm24/postgresql-client:<VERSION> \
    pg_isready -h <DB_HOST> -p <DB_PORT> -U <USERNAME>
```
Example:
```sh
docker run --rm dattm24/postgresql-client:17 \
    pg_isready -h 192.168.10.12 -p 5435 -U db_master
```

---

## 📌 Available Versions
| PostgreSQL Version | Docker Tag |
|--------------------|------------|
| 17 | `postgresql-client:17` |
| 16 | `postgresql-client:16` |
| 15 | `postgresql-client:15` |
| 14 | `postgresql-client:14` |
| 13 | `postgresql-client:13` |
| 12 | `postgresql-client:12` |

---

## 🛠️ Build & Push (For Contributors)
If you want to build and push images for multiple versions:
```sh
for version in 12 13 14 15 16 17; do
    docker build --build-arg PG_MAJOR=$version -t dattm24/postgresql-client:$version .
    docker push dattm24/postgresql-client:$version
done
```

---

## 📄 License
This repository is open-source and follows the **MIT License**.

---

### 🚀 **Now You Can Use PostgreSQL Clients Without Installing PostgreSQL Server!**
