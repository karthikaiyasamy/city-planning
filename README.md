# City Planning - Dog Tag Permit System

A high-fidelity Ruby on Rails 8 application built to handle municipal dog licensing and permit requests, featuring custom user session authentication, dog permit applications, administrative review boards, print-ready document templates, and PostgreSQL database integration.

---

## Prerequisites

Before running the application, make sure you have the following installed on your local machine:

1. **Ruby 3.4.2** (Managed via `rbenv` or another Ruby version manager)
2. **PostgreSQL** (Service must be active on port `5432`)
3. **Bundler** (For managing Ruby gems)

---

## Getting Started

Follow these step-by-step instructions to download, configure, and boot the application locally.

### 1. Clone & Navigate
Navigate into the project root directory:
```bash
cd /path/to/city-planning/city-planning
```

### 2. Configure Environment Variables
Copy the template `.env.example` file to create your local `.env` file:
```bash
cp .env.example .env
```

Open the newly created `.env` file and replace the placeholders with your local PostgreSQL credentials:
```env
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_USERNAME=your_postgres_username
DATABASE_PASSWORD=your_postgres_password
```
*(Note: If you installed PostgreSQL on macOS via Homebrew, your `DATABASE_USERNAME` is typically your macOS system username, and `DATABASE_PASSWORD` can be left blank).*

### 3. Install Dependencies
Install all required gem dependencies listed in the `Gemfile`:
```bash
bundle install
```

### 4. Create and Seed Database
Run the database setup commands. This will create the development and test databases, apply migrations, and populate default seed data:
```bash
bin/rails db:prepare
```

---

## Seed Accounts for Testing

The `db:prepare` task automatically seeds the database with the following demo credentials for testing the user flows:

### 👑 Municipal Admin Account
Use this to approve or reject pending dog tag applications.
*   **Email**: `admin@example.com`
*   **Password**: `password123`

### 🏠 Resident / User Account
Use this to submit new dog tag applications and print approved tag certificates.
*   **Email**: `user@example.com`
*   **Password**: `password123`

---

## Running the Application

To boot the concurrent web server (Puma) locally, execute:
```bash
bin/rails server
```

Once started, open your web browser and navigate to:
👉 **[http://localhost:3000](http://localhost:3000)**

---

## Running Tests
To run the automated suite and verify everything compiles and tests successfully, run:
```bash
bin/rails test
```
