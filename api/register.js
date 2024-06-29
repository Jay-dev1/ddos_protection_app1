export default async function handler(req, res) {
    if (req.method === 'POST') {
      const { email, password } = req.body;
      // Add your registration logic here (e.g., save to database, validate inputs)
      res.status(200).json({ message: 'Registration successful' });
    } else {
      res.status(405).json({ message: 'Method not allowed' });
    }
  }
  