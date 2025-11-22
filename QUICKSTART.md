# Quick Start Guide

## 🚀 Get Up and Running in 5 Minutes

### Step 1: Install Dependencies

**Backend:**
```powershell
cd backend
npm install
```

**Frontend:**
```powershell
cd frontend
npm install
```

### Step 2: Start Backend Server
```powershell
cd backend
npm run dev
```

Server will start on `http://localhost:5000`

### Step 3: Start Frontend (New Terminal)
```powershell
cd frontend
npm run dev
```

Application will open on `http://localhost:5173`

### Step 4: Test the Application

1. **Add a Product**:
   - Click "Add Product" button
   - Fill in: Name, Unit, Category, Brand, Stock
   - Click "Add Product"

2. **Import CSV**:
   - Click "Import CSV"
   - Drag and drop `sample-products.csv` (located in root folder)
   - Watch products populate automatically

3. **Search & Filter**:
   - Type in search box to find products
   - Use category dropdown to filter

4. **Edit Product**:
   - Click "Edit" on any product
   - Change stock quantity
   - Click "Save"

5. **View History**:
   - Click "History" on any product
   - See all stock changes with timestamps

6. **Export Data**:
   - Click "Export CSV"
   - Download complete inventory

---

## 🔧 Troubleshooting

### Backend won't start
```powershell
# Delete node_modules and reinstall
Remove-Item -Recurse -Force node_modules
npm install
```

### Frontend won't start
```powershell
# Clear Vite cache
Remove-Item -Recurse -Force node_modules/.vite
npm run dev
```

### Port already in use
```powershell
# Kill process on port 5000
npx kill-port 5000

# Kill process on port 5173
npx kill-port 5173
```

---

## 📝 Sample Products

Located in `sample-products.csv`:
- 15 pre-configured products
- Multiple categories (Electronics, Furniture, Stationery, etc.)
- Mix of in-stock and out-of-stock items
- Ready to import and test

---

## 🎯 What to Test

### Core Features
- ✅ Add new products
- ✅ Edit products inline
- ✅ Delete products
- ✅ Search by name
- ✅ Filter by category
- ✅ Import CSV (with duplicates)
- ✅ Export CSV
- ✅ View inventory history

### UI/UX
- ✅ Color-coded stock status
- ✅ Toast notifications
- ✅ Responsive design
- ✅ Loading states
- ✅ Modal interactions
- ✅ Sidebar animations

---

## 💻 Tech Stack Summary

**Backend:**
- Node.js + Express
- SQLite database
- Multer for file uploads
- CSV parsing

**Frontend:**
- React 18 + Vite
- Tailwind CSS
- Axios for API calls
- Modern component architecture

---

## 📚 Next Steps

1. **Customize Styling**: Edit `frontend/src/index.css`
2. **Add Features**: Extend controllers in `backend/controllers/`
3. **Deploy**: Follow deployment guide in README.md
4. **Add Tests**: Implement unit and integration tests
5. **Enhance**: Add user authentication, roles, permissions

---

**Need Help?** Check the full README.md for detailed documentation!
