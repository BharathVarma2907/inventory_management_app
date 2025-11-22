# 🚀 Deployment Checklist

## Pre-Deployment Tasks

### Backend Preparation
- [ ] Review and update `.env` file with production values
- [ ] Remove all `console.log` statements or replace with proper logging
- [ ] Test all API endpoints with Postman/Insomnia
- [ ] Verify database migrations work correctly
- [ ] Check error handling and validation
- [ ] Ensure CORS settings allow production frontend URL
- [ ] Set `NODE_ENV=production`
- [ ] Add rate limiting middleware (optional)
- [ ] Configure proper logging (Winston, Morgan, etc.)
- [ ] Test CSV import/export with large files

### Frontend Preparation
- [ ] Update API base URL for production
- [ ] Remove development-only console logs
- [ ] Test build process: `npm run build`
- [ ] Verify all environment variables are set
- [ ] Check responsive design on multiple devices
- [ ] Test with different browsers (Chrome, Firefox, Safari, Edge)
- [ ] Optimize images and assets
- [ ] Test error boundaries and fallbacks
- [ ] Verify all modals and animations work

### Security
- [ ] Review CORS configuration
- [ ] Add helmet.js for security headers (backend)
- [ ] Validate all user inputs
- [ ] Sanitize CSV file uploads
- [ ] Check for SQL injection vulnerabilities
- [ ] Review file upload restrictions
- [ ] Ensure no sensitive data in logs
- [ ] Add CSP (Content Security Policy) headers

### Performance
- [ ] Enable gzip compression
- [ ] Add database indexes
- [ ] Implement connection pooling
- [ ] Optimize database queries
- [ ] Test with large datasets (1000+ products)
- [ ] Check memory leaks
- [ ] Profile API response times

---

## 🌐 Deployment Options

### Option 1: Render (Backend) + Vercel (Frontend)

#### Backend on Render
1. **Create Render Account**: https://render.com
2. **New Web Service**:
   - Repository: Connect your GitHub repo
   - Branch: `main`
   - Root Directory: `backend`
   - Build Command: `npm install`
   - Start Command: `npm start`
3. **Environment Variables**:
   ```
   NODE_ENV=production
   PORT=5000
   DB_PATH=./database.sqlite
   ```
4. **Deploy** and copy the service URL

#### Frontend on Vercel
1. **Install Vercel CLI**: `npm i -g vercel`
2. **Deploy**:
   ```bash
   cd frontend
   vercel
   ```
3. **Environment Variables**:
   - Go to Vercel Dashboard
   - Settings → Environment Variables
   - Add: `VITE_API_URL=https://your-backend.onrender.com/api`
4. **Redeploy** to apply changes

---

### Option 2: Heroku (Full Stack)

#### Backend
```bash
cd backend
heroku create your-inventory-backend
heroku config:set NODE_ENV=production
git push heroku main
```

#### Frontend
```bash
cd frontend
# Update VITE_API_URL in .env
npm run build
# Deploy dist folder to Heroku or Netlify
```

---

### Option 3: Docker + Cloud Hosting

#### Build Docker Images
```bash
# Backend
docker build -t inventory-backend -f backend/Dockerfile .
docker push your-registry/inventory-backend

# Frontend
docker build -t inventory-frontend -f frontend/Dockerfile .
docker push your-registry/inventory-frontend
```

#### Deploy to Cloud
- **AWS ECS/Fargate**
- **Google Cloud Run**
- **Azure Container Instances**
- **DigitalOcean App Platform**

---

### Option 4: VPS (DigitalOcean, Linode, AWS EC2)

#### Setup Steps
```bash
# 1. SSH into server
ssh root@your-server-ip

# 2. Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3. Install PM2
npm install -g pm2

# 4. Clone repository
git clone https://github.com/yourusername/inventory-system.git
cd inventory-system

# 5. Setup Backend
cd backend
npm install --production
cp .env.example .env
# Edit .env with production values

# 6. Start with PM2
pm2 start server.js --name inventory-backend
pm2 save
pm2 startup

# 7. Setup Frontend
cd ../frontend
npm install
npm run build

# 8. Setup Nginx
sudo apt-get install nginx
# Configure Nginx to serve frontend and proxy backend
```

#### Nginx Configuration
```nginx
server {
    listen 80;
    server_name yourdomain.com;

    # Frontend
    location / {
        root /var/www/inventory/frontend/dist;
        try_files $uri $uri/ /index.html;
    }

    # Backend API
    location /api {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

---

## 🔐 SSL Certificate (Let's Encrypt)

```bash
# Install Certbot
sudo apt-get install certbot python3-certbot-nginx

# Get certificate
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Auto-renewal
sudo certbot renew --dry-run
```

---

## 📊 Post-Deployment Verification

### Backend Health Check
```bash
curl https://your-backend.onrender.com/health
# Expected: {"status":"ok","timestamp":"..."}
```

### API Testing
```bash
# Get products
curl https://your-backend.onrender.com/api/products

# Search
curl https://your-backend.onrender.com/api/products/search?name=mouse

# Health
curl https://your-backend.onrender.com/health
```

### Frontend Testing
- [ ] Visit production URL
- [ ] Test all CRUD operations
- [ ] Test CSV import/export
- [ ] Check console for errors
- [ ] Test on mobile device
- [ ] Verify search and filter
- [ ] Check history sidebar

---

## 🔍 Monitoring & Maintenance

### Setup Monitoring
- [ ] **Uptime Robot**: Monitor uptime
- [ ] **Sentry**: Error tracking
- [ ] **LogRocket**: Session replay
- [ ] **Google Analytics**: User analytics

### Regular Maintenance
- [ ] Check logs weekly
- [ ] Monitor database size
- [ ] Review error reports
- [ ] Update dependencies monthly
- [ ] Backup database regularly
- [ ] Monitor API response times
- [ ] Check disk space usage

---

## 📝 Environment Variables Reference

### Backend (.env)
```env
NODE_ENV=production
PORT=5000
DB_PATH=./database.sqlite
FRONTEND_URL=https://your-app.vercel.app
```

### Frontend (.env)
```env
VITE_API_URL=https://your-backend.onrender.com/api
```

---

## 🆘 Rollback Plan

### If Deployment Fails

#### Render
```bash
# Rollback to previous deploy via Render Dashboard
# Settings → Manual Deploy → Select previous commit
```

#### Vercel
```bash
vercel rollback
```

#### VPS with Git
```bash
git reset --hard HEAD^
pm2 restart inventory-backend
```

---

## ✅ Final Checklist

Before going live:
- [ ] All tests passing
- [ ] Documentation updated
- [ ] Environment variables set correctly
- [ ] SSL certificate active
- [ ] Database backed up
- [ ] Error tracking configured
- [ ] Performance optimized
- [ ] Security headers configured
- [ ] CORS properly configured
- [ ] Rate limiting enabled (if applicable)
- [ ] Monitoring setup
- [ ] Team notified
- [ ] Rollback plan ready
- [ ] User documentation available

---

## 🎉 Post-Launch

- [ ] Announce launch
- [ ] Monitor for first 24 hours
- [ ] Collect user feedback
- [ ] Fix critical bugs immediately
- [ ] Update portfolio with live link
- [ ] Add to resume
- [ ] Share on LinkedIn

---

## 📞 Support Contacts

**Production Issues:**
- Backend: Check Render logs
- Frontend: Check Vercel logs
- Database: Check disk space and backups

**Emergency Rollback:**
1. Deploy previous stable version
2. Notify users of maintenance
3. Fix issues in development
4. Test thoroughly
5. Redeploy

---

**Good luck with your deployment! 🚀**
