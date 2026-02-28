# FinImperium - Deployment Cheat Sheet

## 🚀 VERCEL DEPLOYMENT (5 MIN)

### URLs
```
Repository: https://github.com/vatsalparmar007/FinImperium
Vercel: https://vercel.com
Clerk: https://dashboard.clerk.com
```

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

### 5 Steps to Live
1. Go to https://vercel.com → Sign Up with GitHub
2. Click Import Project → Search "FinImperium"
3. Click Continue → Framework auto-detected as Next.js ✓
4. Add all 10 Environment Variables above
5. Click Deploy → Wait 3-5 min → You're live! 🎉

### After Deploy (Important!)
```
Go to: https://dashboard.clerk.com
Settings → URLs
Add your Vercel URL: https://your-domain.vercel.app
```

### Test Live
- Visit your Vercel URL
- Try signup/login
- Create account
- Add transaction

---

## 🟦 RENDER DEPLOYMENT (10 MIN)

### URLs
```
Render: https://render.com
GitHub: https://github.com/vatsalparmar007/FinImperium
Clerk: https://dashboard.clerk.com
```

### Settings
```
Build Command: npm install && npm run build
Start Command: npm run start
Plan: Free (testing) or Pay-as-you-go (production, $0.50-2/day)
```

### Environment Variables
(Same 10 as above, plus add):
```
NODE_ENV=production
```

### 5 Steps to Live
1. Go to https://render.com → Sign Up with GitHub
2. Click New → Web Service
3. Select FinImperium repository
4. Fill in Build Command, Start Command, Plan
5. Add 11 Environment Variables → Deploy

### After Deploy (Important!)
```
Go to: https://dashboard.clerk.com
Settings → URLs
Add your Render URL: https://your-domain.onrender.com
```

---

## ⚡ FOR BOTH PLATFORMS

### Pre-Deploy Test
```bash
npm install
npm run build
npm run start
# Visit http://localhost:3000
```

### If Build Fails
1. Check deployment platform's build logs
2. Run locally: `npm run build`
3. Verify all env vars present
4. Check database connection

### If App Crashes
1. Check platform logs
2. Verify env vars in platform dashboard
3. Test locally: `npm run start`

### If Clerk Not Working
1. Update Clerk dashboard URLs
2. Check secret keys
3. Clear browser cache
4. Check browser console

---

## 📱 CHECKLIST BEFORE DEPLOY

- [ ] Code pushed to GitHub main branch
- [ ] `npm run build` works locally
- [ ] `npm run start` works locally
- [ ] Sign up/login works locally
- [ ] Create account works locally
- [ ] Add transaction works locally
- [ ] No console errors locally
- [ ] All 10 env vars documented
- [ ] GitHub repo is public
- [ ] .env NOT in git (already in .gitignore)

---

## 🎯 WHICH PLATFORM?

### ✅ Choose VERCEL if:
- Want best Next.js experience
- Want instant deployment
- Want built-in analytics
- Using free tier for testing

### ✅ Choose RENDER if:
- Prefer different interface
- Want pay-as-you-go pricing
- Need more control over environment

---

## 💰 PRICING (Pick One)

### VERCEL
```
Free: $0 (testing)
Pro: $20/month (production)
```

### RENDER
```
Free: $0 (8hr/month limit)
Pay-as-you-go: ~$15-60/month
```

---

## 🔗 IMPORTANT LINKS

| What | Link |
|------|------|
| GitHub Repo | https://github.com/vatsalparmar007/FinImperium |
| Vercel Deploy | https://vercel.com/new |
| Render Deploy | https://dashboard.render.com |
| Clerk Dashboard | https://dashboard.clerk.com |
| MongoDB Atlas | https://cloud.mongodb.com |
| Detailed Guide | See VERCEL_QUICK_START.md or RENDER_DEPLOYMENT.md |

---

## 🆘 QUICK FIXES

| Error | Fix |
|-------|-----|
| Build fails | Check build logs, run `npm run build` locally |
| App won't start | Verify all env vars in platform dashboard |
| Clerk error | Update URLs in Clerk dashboard |
| Database error | Check MongoDB connection string |
| Deployment slow | Use Vercel for faster deployment |
| Service spins down | Use Render paid plan or Vercel |

---

## ✨ WHAT'S INCLUDED

✅ Live URL (worldwide access)
✅ HTTPS/SSL (automatic)
✅ Auto-deployments (push to GitHub = auto-update)
✅ Database (MongoDB Atlas running)
✅ Email service (Resend)
✅ Authentication (Clerk)
✅ Security (Arcjet)
✅ AI features (Google Gemini)

---

## 🎉 NEXT 15 MINUTES

1. **MIN 0-2**: Choose platform (Vercel recommended)
2. **MIN 2-5**: Set up deployment (GitHub login, import repo)
3. **MIN 5-10**: Add environment variables
4. **MIN 10-15**: Click deploy & wait
5. **GET**: Live URL! 🚀

---

**Made with ❤️ for FinImperium**
