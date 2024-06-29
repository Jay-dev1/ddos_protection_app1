export default async function handler(req, res) {
    if (req.method === 'POST') {
      const { email, password } = req.body;
      // Implement login logic (e.g., authenticate user)
      res.status(200).json({ message: 'Login successful' });
    } else {
      res.status(405).json({ message: 'Method not allowed' });
    }
  }
  