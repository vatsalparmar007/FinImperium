# FinImperium - Render Deployment Guide

## 🚀 Deploy to Render in 5 Minutes

### Step 1: Visit Render
1. Go to https://render.com
2. Click **Sign Up** → **GitHub**
3. Authorize Render to access your GitHub account

### Step 2: Create New Web Service
1. Click **+ New** → **Web Service**
2. Select your GitHub repository: `FinImperium`
3. Click **Connect**

### Step 3: Configure Service

Fill in the following settings:

| Setting | Value |
|---------|-------|
| **Name** | `finimperium` |
| **Environment** | `Node` |
| **Region** | Select closest to your location |
| **Branch** | `main` |
| **Build Command** | `npm install && npm run build` |
| **Start Command** | `npm run start` |
| **Plan** | `Free` (for testing) or `Pay-as-you-go` (for production) |

### Step 4: Add Environment Variables

Click on **Environment** and add each variable:

| Key | Value |
|-----|-------|
| `DATABASE_URL` | `mongodb+srv://beta9051:vatsal007@cluster0.8ezolrj.mongodb.net/finimperium?appName=Cluster0` |
| `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` | `pk_test_cmFwaWQtY293LTg3LmNsZXJrLmFjY291bnRzLmRldiQ` |
| `CLERK_SECRET_KEY` | `sk_test_tRdLiOYSXfaKRLIFCuqQdPQeuJdup20i20MZ2gNxqG` |
| `NEXT_PUBLIC_CLERK_SIGN_IN_URL` | `/sign-in` |
| `NEXT_PUBLIC_CLERK_SIGN_UP_URL` | `/sign-up` |
| `RESEND_API_KEY` | `re_TtewFWMG_66iy3oo1jCr3BwA7D3nb9k1D` |
| `INNGEST_EVENT_KEY` | `x2wIkBrvOd42lfiQvEP0Z1PWfrOHt8XI6YgnMMQkqDQEfwepr4mObhoguRI9RZN_xZIGiQcivfoJCbqMLLPTjg` |
| `INNGEST_SIGNING_KEY` | `signkey-prod-18ece2950fc221c492b9a605806317f69b3c095c14bf2b8efa72f7df3e41c099` |
| `ARCJET_KEY` | `ajkey_01kjjee3wefc5sxpwknbt01hn8` |
| `GEMINI_API_KEY` | `AIzaSyAmZIVp-VxyArU4CGiEt0LysSnVoo8MMFw` |
| `NODE_ENV` | `production` |

### Step 5: Deploy

Click **Create Web Service**

- Build will start (takes 5-10 minutes)
- Once done, you'll get a URL like: `https://finimperium.onrender.com`

### Step 6: Update Clerk Dashboard

1. Go to https://dashboard.clerk.com
2. Select your app
3. Go to **Settings → URLs**
4. Add your Render URL:
   - **Authorized redirect URLs**: `https://your-app.onrender.com/sign-in/*`
   - **Authorized origins**: `https://your-app.onrender.com`

### Step 7: Wait for Health Check

Render will check if your app responds correctly. Once the health check passes, your app is live!

### Step 8: Test Your Live App

Visit your Render URL and test:
- [ ] Sign up works
- [ ] Sign in works
- [ ] Dashboard loads
- [ ] Can create accounts
- [ ] Can add transactions

---

## 📌 Important Notes for Render

### Free Tier Limitations
- ❌ Services spin down after 15 minutes of inactivity
- ❌ May take 50+ seconds to wake up from sleep
- ✅ Good for testing only

### Recommended for Production
- Upgrade to **"Pay as you go"** plan (~$0.50-2/day)
- Prevents service shutdown
- Better performance

### PostgreSQL Database
- If using Free plan, consider Render's Free PostgreSQL
- Your MongoDB Atlas connection still works on Free tier

---

## 🔄 Automatic Redeployments

Whenever you push to GitHub's `main` branch:
1. Render detects the change
2. Pulls latest code
3. Builds your app
4. Deploys automatically
5. Previous versions kept for rollback

---

## 📊 Monitor Your Deployment

In Render Dashboard:
- **Logs** tab: Real-time application logs
- **Events** tab: Deployment history
- **Metrics** tab: CPU, memory, network usage
- **Settings**: Manage environment variables

---

## 🆘 Troubleshooting

### Build fails?
- Check build logs in Render dashboard
- Run locally: `npm install && npm run build`
- Verify all dependencies in `package.json`

### Service in "suspended" state?
- Happens on Free tier after 15 min inactivity
- Upgrade to paid plan to prevent this
- Or make a request to wake it up

### App crashes?
- Check logs in Render dashboard
- Verify all environment variables are set
- Test locally: `npm run build && npm run start`

### Clerk authentication not working?
- Verify Render URL updated in Clerk Dashboard
- Check `CLERK_SECRET_KEY` and `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
- Check browser console for errors

### Database connection error?
- Verify `DATABASE_URL` in Render environment variables
- Check MongoDB Atlas allows Render's IP
- Test connection string locally

---

## 💰 Pricing

| Feature | Free | Pay-as-you-go |
|---------|------|---------------|
| **Cost** | Free | $0.50-2/day (estimated) |
| **Always On** | ❌ (spins down) | ✅ (always running) |
| **Response Time** | Slow (cold start) | Fast |
| **Memory** | Limited | Optimized |
| **Best For** | Testing | Production |

---

## 🎯 Vercel vs Render

| Feature | Vercel | Render |
|---------|--------|--------|
| **Next.js Support** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Ease of Use** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Free Tier** | ✅ Limited | ✅ Limited (spins down) |
| **Pricing** | $20+/month (Pro) | $0.50+/day (Pay-as-you-go) |
| **Cold Start** | Instant | 5-10 sec |
| **User Experience** | Better | Good |

**Recommendation**: Use Vercel for best Next.js experience

---

## 📈 Next Steps

1. **Test thoroughly** on live deployment
2. **Monitor logs** for any errors
3. **Set up email notifications** for deployment alerts
4. **Configure custom domain** (optional)
5. **Enable auto-deployments** (already configured)
6. **Upgrade plan** when ready for production traffic
