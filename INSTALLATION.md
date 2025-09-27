# MeCOGO Installation & Setup Guide

## 📋 Prerequisites

Before you begin, ensure you have:
- **Node.js** 18 or higher installed
- **Yarn** package manager
- **Supabase** account (free tier available)
- **Git** for version control

## 🚀 Step-by-Step Installation

### 1. Project Setup
```bash
# Clone the repository
git clone <your-repository-url>
cd mecogo

# Install dependencies
yarn install
```

### 2. Supabase Database Setup

#### A. Create Supabase Project
1. Go to [supabase.com](https://supabase.com)
2. Sign up/login to your account
3. Click "New Project"
4. Choose organization and fill project details:
   - **Name:** MeCOGO
   - **Database Password:** (secure password)
   - **Region:** (closest to your users)
5. Wait for project initialization (~2 minutes)

#### B. Get Project Credentials
1. In your Supabase dashboard, go to **Settings** → **API**
2. Copy these values:
   - **Project URL** (looks like: `https://abcdefgh.supabase.co`)
   - **Anon/Public Key** (starts with `eyJ...`)

#### C. Configure Environment Variables
1. Copy `.env` file in your project root
2. Replace placeholder values:
```env
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
VITE_APP_NAME=MeCOGO
VITE_APP_VERSION=1.0.0
```

#### D. Run Database Schema
1. Open Supabase Dashboard → **SQL Editor**
2. Create new query
3. Copy entire content from `database/schema.sql`
4. Click **Run** to execute
5. Verify tables are created in **Table Editor**

### 3. Development Server
```bash
# Start development server
yarn dev

# Server will run on http://localhost:5173
```

### 4. Verify Installation

#### A. Database Verification
In Supabase **Table Editor**, check these tables exist:
- ✅ `users`
- ✅ `goals` 
- ✅ `tasks`
- ✅ `habits`
- ✅ `progress_logs`
- ✅ `accountability`
- ✅ `badges`
- ✅ `subscriptions`
- ✅ `translations`

#### B. Application Verification
1. Open `http://localhost:5173`
2. Test language switching (English ↔ Persian)
3. Try login with test credentials
4. Verify all UI components load correctly

## 🔧 Configuration Options

### Language Settings
- **Default Language:** English
- **Supported Languages:** English (en), Persian (fa)
- **RTL Support:** Automatic for Persian
- **Font Loading:** Inter (EN), Vazirmatn (FA)

### Database Configuration
- **Connection:** Automatic via Supabase client
- **Authentication:** Supabase Auth with RLS
- **Real-time:** Enabled for live updates
- **Security:** Row Level Security policies applied

### Authentication Setup
The schema automatically configures:
- User registration triggers
- Profile creation on signup
- Default subscription assignment
- Security policies for data access

## 🚨 Troubleshooting

### Common Issues

#### 1. Environment Variables Not Loading
```bash
# Check if .env file exists
ls -la .env

# Restart development server
yarn dev
```

#### 2. Database Connection Error
- Verify Supabase URL and key are correct
- Check project is not paused in Supabase dashboard
- Ensure schema was run successfully

#### 3. Authentication Issues
- Verify RLS policies are enabled
- Check user trigger function exists
- Confirm auth settings in Supabase dashboard

#### 4. Language/Font Issues
- Clear browser cache
- Check Google Fonts connection
- Verify Tailwind CSS compilation

### Support Commands
```bash
# Check dependencies
yarn install --check-files

# Clear node modules and reinstall
rm -rf node_modules yarn.lock
yarn install

# Build production bundle
yarn build

# Preview production build
yarn preview
```

## 🌐 Production Deployment

### Netlify Deployment
1. Build the project: `yarn build`
2. Use Publish button in development environment
3. Add environment variables in Netlify dashboard
4. Configure Supabase auth URL with your domain

### Environment Variables for Production
```env
VITE_SUPABASE_URL=your-production-supabase-url
VITE_SUPABASE_ANON_KEY=your-production-anon-key
VITE_APP_NAME=MeCOGO
VITE_APP_VERSION=1.0.0
```

### Post-Deployment Checklist
- [ ] Supabase auth redirects configured
- [ ] Environment variables set
- [ ] Custom domain configured (optional)
- [ ] SSL certificate verified
- [ ] Database migrations completed
- [ ] Email templates configured (if needed)

## 📞 Getting Help

If you encounter issues:

1. **Check Logs:** Browser console and network tab
2. **Supabase Logs:** Dashboard → Logs section
3. **Documentation:** Refer to Supabase and React docs
4. **Community:** Join Supabase Discord for support

## ✅ Installation Complete!

Your MeCOGO application is now ready! 🎉

**Next Steps:**
1. Create your first user account
2. Set up goals and habits
3. Explore the bilingual interface
4. Test all features work correctly
5. Consider deploying to production

Happy goal tracking! 🎯
