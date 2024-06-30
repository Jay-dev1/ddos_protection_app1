const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

// Login User Function
exports.loginUser = functions.https.onRequest(async (req, res) => {
  const { email } = req.body;

  try {
    const user = await admin.auth().getUserByEmail(email);

    // Generate a custom token for the user
    const customToken = await admin.auth().createCustomToken(user.uid);

    res.status(200).send({ token: customToken });
  } catch (error) {
    res.status(400).send(error.message);
  }
});
