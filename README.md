# ArtFundi Dev Test – Client CRM System

This project is a technical assessment for ArtFundi. It is a basic CRM system that allows an admin to manage client records — including creating, viewing, filtering, updating, and soft-deleting clients.

---

## 🛠️ Tech Stack

-   **Laravel 9** (Backend API)
-   **PHP 8**
-   **MySQL 8**
-   **Vue.js 3** (Frontend)
-   **Axios** (AJAX Requests)
-   **Bootstrap 5.2**
-   **Bitbucket/GitHub** (Version Control)

---

## ✅ Features

-   Secure **admin login** (authentication only, no registration/forgot password)
-   Fully functional **CRUD for clients**
    -   Create, view, update, and soft-delete records
-   **Client filtering** by:
    -   First name
    -   Last name
    -   Email address
    -   Telephone number
-   **Form validation** (front-end & back-end)
-   **AJAX-based operations** with Axios
-   **Responsive UI** using ArtFundi CI colors
-   **Mobile-friendly design**

---

## 🔐 Login Credentials

Use the credentials below to log into the system:

```
URL: http://localhost:8000/login

Username: admin@root.com
Password: adminRoot1
```

> Replace with the actual login you created for the test admin user.

---

## 🧬 Database

Client table structure includes the following required fields:

-   `id` (auto-increment)
-   `uuid` (generated via `Str::uuid()`)
-   `id_number`
-   `date_of_birth`
-   `first_name`
-   `last_name`
-   `email_address`
-   `telephone`
-   `status`
-   `deleted_at` (for soft deletes)
-   `created_at`, `updated_at`

A SQL dump is included in this repository with **20 test client records**:

```
/database/sql/clients.sql
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Christian-Devs/example-app.git
cd example-app
```

### 2. Install Dependencies

```bash
composer install
npm install && npm run dev
```

### 3. Environment Setup

Copy `.env.example` to `.env` and update:

```bash
cp .env.example .env
php artisan key:generate
```

Configure your database credentials in `.env`.

### 4. Run Migrations & Seed Data

```bash
php artisan migrate
php artisan db:seed
```

Or import the provided SQL dump:

```bash
mysql -u root -p your_database < database/sql/clients.sql
```

### 5. Run the App

```bash
php artisan serve
```

Visit [http://localhost:8000](http://localhost:8000)

---

## 📂 Folder Structure

-   `app/Models/Client.php` – Client model
-   `app/Http/Controllers/ClientController.php` – CRUD logic
-   `resources/js/components/` – Vue components
-   `routes/api.php` – API routes
-   `resources/views` – Main blade views (if any)
-   `database/migrations` – DB schema

---

## 📦 Deployment Notes

-   API is stateless and token-auth ready.
-   Can be hosted via Laravel Forge or shared hosting with `.htaccess` support.
-   Ensure `public/` is set as web root.

---

## 🤝 Credits

This project was developed by Christian as part of the ArtFundi Technical Assessment (2023/2024).

---

## 📬 Contact

For any questions or access issues, please reach out to:

```
📧 christianvanwyk27@gmail.com
```
