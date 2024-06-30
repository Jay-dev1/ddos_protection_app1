const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.registerUser = functions.https.onRequest(async (req, res) => {
  const { email, password } = req.body;

  try {
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

    res.status(201).send(userRecord);
  } catch (error) {
    res.status(400).send(error.message);
  }
});
