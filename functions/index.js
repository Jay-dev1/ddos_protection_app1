const functions = require('firebase-functions'); // Make sure you are using this
const admin = require('firebase-admin');
admin.initializeApp();

const rateLimitWindow = 60 * 1000; // 1 minute
const maxRequests = 5;
const ipRequests = {};

exports.rateLimitedAuth = functions.https.onRequest(async (req, res) => {
  const ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;

  // Check IP blacklisting
  const blacklisted = await admin.firestore().collection('blacklist').doc(ip).get();
  if (blacklisted.exists) {
    res.status(403).send('Forbidden');
    return;
  }

  if (!ipRequests[ip]) {
    ipRequests[ip] = [];
  }

  const now = Date.now();
  ipRequests[ip] = ipRequests[ip].filter(timestamp => now - timestamp < rateLimitWindow);

  if (ipRequests[ip].length >= maxRequests) {
    res.status(429).send('Too many requests - try again later');
    return;
  }

  ipRequests[ip].push(now);
  // Add your Firebase Auth logic here
  res.send('Request processed');
});
