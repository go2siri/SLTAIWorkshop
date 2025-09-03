import express from 'express';

const router = express.Router();

// Mock user routes for demo
router.get('/profile', async (req, res) => {
  try {
    // Mock user profile
    const mockProfile = {
      id: '1',
      name: 'Demo User',
      email: 'demo@example.com',
      userType: 'patient',
      location: {
        latitude: 37.7749,
        longitude: -122.4194
      },
      medicalConditions: ['Dementia'],
      assignedCaregivers: ['caregiver1', 'caregiver2'],
      createdAt: '2025-09-03T00:00:00.000Z'
    };
    
    res.json({
      success: true,
      data: mockProfile
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to fetch user profile'
    });
  }
});

router.put('/profile', async (req, res) => {
  try {
    const updates = req.body;
    
    // Mock profile update
    const updatedProfile = {
      id: '1',
      name: updates.name || 'Demo User',
      email: updates.email || 'demo@example.com',
      userType: updates.userType || 'patient',
      location: updates.location || {
        latitude: 37.7749,
        longitude: -122.4194
      },
      updatedAt: new Date().toISOString()
    };
    
    res.json({
      success: true,
      data: updatedProfile,
      message: 'Profile updated successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to update profile'
    });
  }
});

router.get('/caregivers', async (req, res) => {
  try {
    // Mock caregivers list
    const mockCaregivers = [
      {
        id: 'caregiver1',
        name: 'John Smith',
        type: 'assigned',
        distance: 0.5,
        available: true
      },
      {
        id: 'caregiver2',
        name: 'Sarah Johnson',
        type: 'nearby',
        distance: 0.8,
        available: true
      }
    ];
    
    res.json({
      success: true,
      data: mockCaregivers
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to fetch caregivers'
    });
  }
});

export default router;