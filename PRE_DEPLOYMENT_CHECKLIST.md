# FinImperium - Pre-Deployment Checklist

## ✅ Before You Deploy

### Code & Repository
- [ ] Latest code is committed to GitHub
- [ ] All changes pushed to `main` branch
- [ ] No uncommitted changes in working directory
- [ ] `.env` file is in `.gitignore` (✓ Already in your .gitignore)
- [ ] No hardcoded secrets in code files
- [ ] README.md is present and updated

### Dependencies
- [ ] `npm install` runs without errors locally
- [ ] All dependencies in `package.json` are compatible
- [ ] `npm run build` works locally (test: `npm run build`)
- [ ] `npm run start` works locally
- [ ] No peer dependency warnings

### Environment Variables
- [ ] `DATABASE_URL` is correct and accessible
- [ ] `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` is set
- [ ] `CLERK_SECRET_KEY` is secure and not exposed
- [ ] `RESEND_API_KEY` is valid
- [ ] `INNGEST_EVENT_KEY` and `INNGEST_SIGNING_KEY` are set
- [ ] `ARCJET_KEY` is set
- [ ] `GEMINI_API_KEY` is set
- [ ] All 10 environment variables documented

### Database
- [ ] MongoDB Atlas cluster is running
- [ ] Database connection string is correct
- [ ] Collections created (Account, Transaction, Budget, etc.)
- [ ] Network access allows external connections
- [ ] Backup enabled in MongoDB Atlas
- [ ] Prisma migrations applied (`npx prisma db push`)

### Authentication (Clerk)
- [ ] Clerk project created
- [ ] `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY` from Clerk
- [ ] `CLERK_SECRET_KEY` from Clerk
- [ ] Clerk URLs configured for localhost (for testing)
- [ ] Ready to update Clerk URLs after deployment

### External Services
- [ ] Gmail/Resend configured for emails
- [ ] Inngest account created
- [ ] Arcjet security configured
- [ ] Google Generative AI API key valid
- [ ] All API services have active accounts

### Code Quality
- [ ] No `console.log` statements for debugging
- [ ] Error handling implemented
- [ ] API routes have proper error responses
- [ ] No TODO or FIXME comments blocking deployment
- [ ] Run `npm run lint` - no critical errors

### Testing
- [ ] Local testing completed (signup, login, create account, add transaction)
- [ ] No console errors in browser dev tools
- [ ] All forms work correctly
- [ ] Navigation between pages works
- [ ] Responsive on mobile devices

### Configuration Files
- [ ] `next.config.mjs` - correct settings
- [ ] `tailwind.config.js` - no issues
- [ ] `jsconfig.json` - path aliases correct
- [ ] `middleware.js` - routes protected correctly
- [ ] `prisma/schema.prisma` - synced with database

### Security
- [ ] HTTPS enabled after deployment (automatic on both platforms)
- [ ] CORS configured if needed
- [ ] Rate limiting from Arcjet configured
- [ ] No sensitive data in public folder
- [ ] API endpoints have proper validation

---

## 🚀 Command to Test Before Deploying

```bash
# Install dependencies
npm install

# Build the project (same as deployment)
npm run build

# Start the production server (same as deployment)
npm run start
```

**If all three commands succeed, you're ready to deploy!**

---

## 🔍 Common Issues to Check

### Build Failures
```bash
# Check for unused imports
npm run lint

# Ensure all dependencies installed
npm install

# Clear build cache
rm -rf .next node_modules package-lock.json
npm install
npm run build
```

### Runtime Errors
- [ ] Check console output during `npm run start`
- [ ] Verify all environment variables set locally
- [ ] Test API endpoints with Postman/curl
- [ ] Check database connection works

### Missing Environment Variables
```bash
# Print all required env vars
echo "DATABASE_URL: $DATABASE_URL"
echo "CLERK_SECRET_KEY: $CLERK_SECRET_KEY"
# ... etc for all vars
```

---

## 📋 Deployment Decision Matrix

| Need | Choose |
|------|--------|
| **Personal project** | Vercel Free Tier |
| **Production app** | Vercel Pro ($20/month) |
| **Budget conscious** | Render Pay-as-you-go (~$0.50/day) |
| **Always on** | Both Vercel Pro or Render Paid |
| **Best performance** | Vercel |
| **Quick start** | Vercel (easier for Next.js) |

---

## ✨ After Deployment Checklist

- [ ] Deployment successful (app is live)
- [ ] Update Clerk dashboard with live URL
- [ ] Test all features on live site
- [ ] Verify emails are being sent
- [ ] Monitor logs for errors
- [ ] Set up monitoring/alerts
- [ ] Configure custom domain (optional)
- [ ] Enable analytics
- [ ] Share live link with team

---

## 📞 Support Resources

| Issue | Resource |
|-------|----------|
| Next.js Questions | https://nextjs.org/docs |
| Clerk Issues | https://docs.clerk.com |
| MongoDB Problems | https://docs.mongodb.com |
| Vercel Help | https://vercel.com/docs |
| Render Help | https://render.com/docs |

---

## 🎯 You're Ready When:
✅ All checks above are marked  
✅ Local `npm run build` succeeds  
✅ Local `npm run start` works  
✅ All features tested locally  
✅ GitHub repo up to date  
✅ All environment variables documented  

**Once all are complete, proceed with deployment!**
