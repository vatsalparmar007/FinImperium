# FinImperium - Deployment Guide

## Option 1: Deploy to Vercel (Recommended)

Vercel is the optimal choice for Next.js projects with best performance, automatic optimizations, and seamless GitHub integration.

### Prerequisites
- GitHub account with your repository pushed
- Vercel account (free tier available)

### Step 1: Connect Your Repository to Vercel

1. Go to [https://vercel.com](https://vercel.com)
2. Click **Sign Up** and choose **Continue with GitHub**
3. Authorize Vercel to access your GitHub account
4. You'll see your repositories listed
5. Find `FinImperium` and click **Import**

### Step 2: Configure Project Settings

When importing, you'll see:

- **Framework Preset**: Should auto-detect "Next.js" ✓
- **Root Directory**: Set to `./` (default)
- **Build Command**: `next build` (default)
- **Output Directory**: `.next` (default)

### Step 3: Add Environment Variables

In the Vercel dashboard, go to **Settings → Environment Variables** and add all variables from your `.env` file:

```
DATABASE_URL=mongodb+srv://beta9051:vatsal007@cluster0.8ezolrj.mongodb.net/finimperium?appName=Cluster0
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_cmFwaWQtY293LTg3LmNsZXJrLmFjY291bnRzLmRldiQ
CLERK_SECRET_KEY=sk_test_tRdLiOYSXfaKRLIFCuqQdPQeuJdup20i20MZ2gNxqG
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
RESEND_API_KEY=re_TtewFWMG_66iy3oo1jCr3BwA7D3nb9k1D
INNGEST_EVENT_KEY=x2wIkBrvOd42lfiQvEP0Z1PWfrOHt8XI6YgnMMQkqDQEfwepr4mObhoguRI9RZN_xZIGiQcivfoJCbqMLLPTjg
INNGEST_SIGNING_KEY=signkey-prod-18ece2950fc221c492b9a605806317f69b3c095c14bf2b8efa72f7df3e41c099
ARCJET_KEY=ajkey_01kjjee3wefc5sxpwknbt01hn8
GEMINI_API_KEY=AIzaSyAmZIVp-VxyArU4CGiEt0LysSnVoo8MMFw
```

**Important**: Make sure all environment variables are added - these are required for your app to function.

### Step 4: Deploy

1. Click **Deploy**
2. Vercel will build and deploy your project
3. You'll get a URL like `https://finimperium.vercel.app`
4. Wait for the deployment to complete (usually 3-5 minutes)

### Step 5: Update Clerk Authentication URLs

After deployment, update your Clerk settings:

1. Go to [Clerk Dashboard](https://dashboard.clerk.com)
2. Select your application
3. Go to **Settings → URLs**
4. Update:
   - **Sign-in URL**: `https://your-deployed-url.vercel.app/sign-in`
   - **Sign-up URL**: `https://your-deployed-url.vercel.app/sign-up`

### Step 6: Enable Automatic Deployments

Once connected, every push to your main branch will auto-deploy. To verify:
1. Go to your Vercel project dashboard
2. Check **Deployments** tab to see build history

---

## Option 2: Deploy to Render

Render is another great option with good free tier support.

### Prerequisites
- GitHub account with your repository pushed
- Render account (free tier available)

### Step 1: Create New Web Service

1. Go to [https://render.com](https://render.com)
2. Sign up with GitHub
3. Click **New** → **Web Service**
4. Connect your GitHub account
5. Select the `FinImperium` repository

### Step 2: Configure Build Settings

Set the following:

- **Name**: `finimperium` (or your preferred name)
- **Environment**: `Node`
- **Region**: Choose closest to your users
- **Branch**: `main`
- **Build Command**: `npm install && npm run build`
- **Start Command**: `npm run start`

### Step 3: Add Environment Variables

In Render dashboard:
1. Click **Environment** tab
2. Add all variables from your `.env` file (same as Vercel list above)

### Step 4: Choose Plan

- **Free Tier**: Good for testing, but services spin down after 15 min of inactivity
- **Paid**: Recommended for production ($7+/month)

### Step 5: Deploy

Click **Create Web Service** and Render will start building.

### Step 6: Update Clerk Settings

Same as Vercel - update your Clerk dashboard with your Render URL.

---

## Important Pre-Deployment Checklist

- [ ] All environment variables are secured and not in `.env` file in repo
- [ ] `.env` is in `.gitignore` (it already is)
- [ ] All dependencies in `package.json` are correct
- [ ] `npm install` and `npm run build` work locally
- [ ] No hardcoded credentials in code
- [ ] Prisma migrations are up to date
- [ ] Database connection string is correct and accessible from deployment

---

## MongoDB Connection Security

Your MongoDB URL is publicly visible in deployment. For production, consider:

1. **IP Whitelist**: In MongoDB Atlas, go to **Network Access** and add your deployment platform's IP
   - Vercel: Add `0.0.0.0/0` (they use dynamic IPs)
   - Render: Same approach

2. **Better Approach**: Use MongoDB Atlas env variables (already configured)

3. **Even Better**: Create a separate MongoDB Atlas cluster for production with restricted access

---

## Testing After Deployment

1. Visit your deployed URL
2. Test signup/signin with Clerk
3. Test creating accounts and transactions
4. Check browser console for errors
5. Monitor logs in Vercel/Render dashboard

---

## Troubleshooting

### Build Fails
- Check **Deployment Logs** in your platform dashboard
- Ensure all environment variables are set
- Run `npm install` and `npm run build` locally to debug

### App Crashes After Deploy
- Check platform logs for errors
- Verify database connection string is correct
- Check all required environment variables are present

### Clerk Authentication Not Working
- Verify Clerk URLs are updated in Clerk Dashboard
- Check `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` is set

### Database Connection Error
- Verify `DATABASE_URL` is correct
- Check MongoDB Atlas network access is configured
- Ensure Prisma client is generated (`npm run postinstall`)

---

## Recommended Deployment Strategy

1. **Start with Vercel** (free tier, excellent Next.js integration)
2. **Set up GitHub integration** for auto-deployments
3. **Monitor performance** using Vercel Analytics
4. **Scale to production plan** when needed

Your app is ready for deployment! Choose Vercel for the smoothest experience.
