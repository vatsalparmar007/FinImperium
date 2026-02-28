# FinImperium - Vercel Deployment Quick Start

## 🚀 Deploy in 5 Minutes

### Step 1: Verify Your GitHub Repository
Your repository is already set up at: `https://github.com/vatsalparmar007/FinImperium`

Make sure your latest code is pushed:
```bash
git add .
git commit -m "Ready for production deployment"
git push origin main
```

### Step 2: Go to Vercel
1. Visit https://vercel.com
2. Click **Sign Up** → **Continue with GitHub**
3. Authorize Vercel

### Step 3: Import Project
1. Click **Import an existing project**
2. Click **Import Git Repository**
3. Paste: `https://github.com/vatsalparmar007/FinImperium`
4. Click **Continue**

### Step 4: Configure Project
- **Framework**: Next.js (auto-detected) ✓
- **Root Directory**: `./` ✓
- **Build Command**: `next build` ✓
- **Start Command**: `next start` ✓

Click **Continue**

### Step 5: Add Environment Variables

Click **Add Environment Variable** and fill in these keys:

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

✅ Click **Deploy**

### Step 6: Wait for Deployment
- Build phase: ~2-3 minutes
- You'll get a live URL like: `https://finimperium.vercel.app`

### Step 7: Update Clerk Dashboard
1. Go to https://dashboard.clerk.com
2. Select your app
3. Go to **Settings → URLs**
4. Update **Authorized redirect URLs** and **Authorized origins**:
   - Add your Vercel URL: `https://your-deployment-name.vercel.app`

### Step 8: Test Your Live App
1. Visit your deployed URL
2. Try signing up/logging in
3. Create an account
4. Add a transaction

---

## ✅ Pre-Deployment Verification

**Locally, run:**

```bash
npm install
npm run build
npm run start
```

All should work without errors.

---

## 🔐 Security Notes

⚠️ **Your environment variables contain secrets. Keep them secure:**
- Never commit `.env` to GitHub (it's in `.gitignore` ✓)
- Only share secrets with trusted sources
- Consider rotating these keys after going live

---

## 📊 Monitor Your Deployment

In Vercel Dashboard:
- **Deployments** tab: See build history
- **Logs** tab: Check for runtime errors
- **Analytics** tab: Monitor performance
- **Settings**: Manage domains, environment variables

---

## 🔄 Automatic Redeployments

Every time you push to `main` branch, Vercel automatically:
1. Pulls latest code from GitHub
2. Runs build command
3. Deploys new version
4. Keeps previous versions for rollback

---

## 🆘 Troubleshooting

### Build fails?
- Check Vercel build logs
- Run `npm install && npm run build` locally to debug
- Ensure all dependencies are in `package.json`

### App not loading?
- Check browser console for errors
- Verify all environment variables are set in Vercel
- Check Vercel function logs

### Clerk auth not working?
- Update Clerk dashboard URLs (Step 7)
- Verify `CLERK_SECRET_KEY` and `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`

### Database connection error?
- Verify `DATABASE_URL` in Vercel environment variables
- Check MongoDB Atlas allows Vercel's IPs
- Test connection locally first

---

## 📈 Next Steps

1. **Domain**: Add a custom domain in Vercel Settings
2. **Monitoring**: Set up error tracking (Sentry, Vercel Analytics)
3. **Backups**: Enable MongoDB Atlas automatic backups
4. **Performance**: Monitor Core Web Vitals in Vercel Analytics
5. **Scaling**: Upgrade to Vercel Pro if needed ($20/month)

---

**That's it! Your app is live!** 🎉
