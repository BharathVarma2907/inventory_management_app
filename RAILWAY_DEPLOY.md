# 🚂 Railway Backend Deployment - Step by Step

## Step 1: Create Railway Account

1. Go to **https://railway.app**
2. Click **"Login"** (top right)
3. Click **"Login with GitHub"**
4. Authorize Railway to access your repositories

---

## Step 2: Create New Project

1. Click **"New Project"** button
2. Select **"Deploy from GitHub repo"**
3. You'll see a list of your repositories
4. Find and click: **`BharathVarma2907/inventory_management_app`**

---

## Step 3: Configure the Service

After selecting the repo, Railway will create a service automatically.

### 3.1 Add Environment Variables
1. Click on your service (the card that appears)
2. Go to **"Variables"** tab
3. Click **"New Variable"**
4. Add these two variables:

```
NODE_ENV = production
PORT = 5000
```

### 3.2 Configure Build Settings
1. Click **"Settings"** tab
2. Scroll to **"Build"** section
3. Set **Build Command**: `cd backend && npm install`
4. Set **Start Command**: `cd backend && npm start`
5. Leave **Root Directory** blank

---

## Step 4: Generate Public URL

1. Stay in **"Settings"** tab
2. Scroll to **"Networking"** section
3. Click **"Generate Domain"**
4. Railway will give you a URL like:
   ```
   https://inventory-management-app-production-xxxx.up.railway.app
   ```
5. **Copy this URL** - you'll need it for Vercel!

---

## Step 5: Wait for Deployment

1. Go to **"Deployments"** tab
2. Watch the logs as it builds
3. Look for: **"✅ Server running on port 5000"**
4. Once you see that, your backend is live!

---

## Step 6: Test Your Backend

Open in browser:
```
https://your-railway-url.up.railway.app/api/products
```

You should see JSON with products!

---

## Step 7: Connect Frontend to Backend

Now go back to **Vercel**:

1. Go to https://vercel.com/dashboard
2. Click on your project: **inventorymanagementapp-seven**
3. Go to **"Settings"** → **"Environment Variables"**
4. Click **"Add New"**
5. Add:
   - **Name**: `VITE_API_URL`
   - **Value**: `https://your-railway-url.up.railway.app/api`
6. Click **"Save"**

---

## Step 8: Redeploy Frontend

1. Go to **"Deployments"** tab in Vercel
2. Find the latest deployment
3. Click the **"..."** menu (three dots)
4. Click **"Redeploy"**
5. Wait for deployment to complete

---

## Step 9: Test Everything! 🎉

Open your frontend:
```
https://inventorymanagementapp-seven.vercel.app
```

You should now see:
- ✅ Products loading from backend
- ✅ Search working
- ✅ Add/Edit/Delete working
- ✅ All features functional!

---

## 🔧 Troubleshooting

### Backend not starting?
- Check Railway logs: Deployments → View Logs
- Verify environment variables are set

### Frontend not connecting?
- Verify `VITE_API_URL` in Vercel settings
- Make sure URL ends with `/api`
- Check Railway domain is generated and public

### Database empty?
- Backend will auto-create sample data on first run
- Check Railway logs for "📦 Adding sample data..."

---

## 📊 Monitor Your Apps

**Railway Dashboard:**
- View real-time logs
- Check resource usage
- See deployment history

**Vercel Dashboard:**
- View analytics
- Check deployment logs
- Monitor performance

---

## ✅ Final Checklist

- [ ] Railway account created
- [ ] Backend deployed and running
- [ ] Public domain generated
- [ ] Backend API responding
- [ ] Vercel environment variable added
- [ ] Frontend redeployed
- [ ] Products loading in UI
- [ ] All features working

---

## 🎯 Your URLs

After deployment, you'll have:

- **GitHub**: https://github.com/BharathVarma2907/inventory_management_app
- **Frontend**: https://inventorymanagementapp-seven.vercel.app
- **Backend**: [Your Railway URL]

Save these for your submission! 🚀
