import express from 'express';

const router = express.Router();

// Mock notification routes for demo
router.post('/send', async (req, res) => {
  try {
    const { userId, title, body, type } = req.body;
    
    // Mock notification sending
    const notification = {
      id: Date.now().toString(),
      userId: userId || '1',
      title: title || 'Emergency Alert',
      body: body || 'Someone needs help nearby',
      type: type || 'emergency',
      sent: true,
      timestamp: new Date().toISOString()
    };
    
    res.json({
      success: true,
      data: notification,
      message: 'Notification sent successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to send notification'
    });
  }
});

router.post('/subscribe', async (req, res) => {
  try {
    const { userId, topic, token } = req.body;
    
    // Mock subscription
    const subscription = {
      userId: userId || '1',
      topic: topic || 'emergency_alerts',
      token: token || 'demo_fcm_token',
      subscribed: true,
      timestamp: new Date().toISOString()
    };
    
    res.json({
      success: true,
      data: subscription,
      message: 'Subscribed to notifications'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Subscription failed'
    });
  }
});

router.delete('/unsubscribe', async (req, res) => {
  try {
    const { userId, topic } = req.body;
    
    res.json({
      success: true,
      message: 'Unsubscribed from notifications'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Unsubscription failed'
    });
  }
});

router.post('/wellness-reminder', async (req, res) => {
  try {
    const { userId, medicationName, scheduledTime } = req.body;
    
    // Mock wellness reminder
    const reminder = {
      id: Date.now().toString(),
      userId: userId || '1',
      medicationName: medicationName || 'Daily Medication',
      scheduledTime: scheduledTime || '09:00',
      status: 'scheduled',
      createdAt: new Date().toISOString()
    };
    
    res.json({
      success: true,
      data: reminder,
      message: 'Wellness reminder scheduled'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to schedule reminder'
    });
  }
});

export default router;