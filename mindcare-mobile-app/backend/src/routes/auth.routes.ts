import express from 'express';
import { authRateLimiter } from '../middleware/rateLimiter';

const router = express.Router();

// Mock authentication routes for demo
router.post('/login', authRateLimiter, async (req, res) => {
  try {
    const { email, password } = req.body;
    
    // Mock login logic
    if (email && password) {
      const mockUser = {
        id: '1',
        email,
        userType: 'patient',
        name: 'Demo User'
      };
      
      const mockToken = 'demo_jwt_token';
      
      res.json({
        success: true,
        data: {
          user: mockUser,
          token: mockToken
        }
      });
    } else {
      res.status(400).json({
        success: false,
        error: 'Email and password are required'
      });
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Authentication failed'
    });
  }
});

router.post('/register', authRateLimiter, async (req, res) => {
  try {
    const { name, email, password: _password, userType } = req.body;
    
    // Mock registration logic
    const mockUser = {
      id: Date.now().toString(),
      name,
      email,
      userType: userType || 'patient',
      createdAt: new Date().toISOString()
    };
    
    res.status(201).json({
      success: true,
      data: {
        user: mockUser,
        token: 'demo_jwt_token'
      },
      message: 'User registered successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Registration failed'
    });
  }
});

router.post('/google', authRateLimiter, async (req, res) => {
  try {
    const { token: _token } = req.body;
    
    // Mock Google authentication
    const mockUser = {
      id: Date.now().toString(),
      name: 'Google User',
      email: 'user@google.com',
      userType: 'patient',
      provider: 'google'
    };
    
    res.json({
      success: true,
      data: {
        user: mockUser,
        token: 'demo_google_jwt_token'
      }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Google authentication failed'
    });
  }
});

export default router;