import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MindAnchorApp());
}

// Brand Colors based on brandingcolors.md
class BrandColors {
  static const Color mindBlue = Color(0xFF4299E1);
  static const Color anchorGold = Color(0xFFF6AD55);
  static const Color brightCyan = Color(0xFF00D4FF);
  static const Color deepNavy = Color(0xFF2D3748);
  static const Color lightBlue = Color(0xFF90CDF4);
  static const Color warmCream = Color(0xFFFFF8F0);
  static const Color neutralGray = Color(0xFF718096);
  static const Color pureWhite = Color(0xFFFFFFFF);
}

class MindAnchorApp extends StatelessWidget {
  const MindAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindAnchor - AI powered Dementia Safety and Community Ecosystem',
      theme: ThemeData(
        primaryColor: BrandColors.mindBlue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BrandColors.mindBlue,
          primary: BrandColors.mindBlue,
          secondary: BrandColors.anchorGold,
          surface: BrandColors.warmCream,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: BrandColors.deepNavy,
          foregroundColor: BrandColors.pureWhite,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: BrandColors.pureWhite,
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.warmCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header Section with Logo
              _buildHeader(),
              const SizedBox(height: 40),
              
              // Emergency SOS Button
              _buildSOSButton(context),
              const SizedBox(height: 40),
              
              // Feature Cards
              _buildFeatureCards(),
              const SizedBox(height: 30),
              
              // Quick Actions
              _buildQuickActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [BrandColors.deepNavy, BrandColors.mindBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: BrandColors.deepNavy.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: BrandColors.pureWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Semantics(
                label: 'MindAnchor logo',
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.anchor,
                      size: 50,
                      color: BrandColors.mindBlue,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'MindAnchor',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: BrandColors.pureWhite,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'AI powered Dementia Safety and Community Ecosystem',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: BrandColors.pureWhite.withOpacity(0.95),
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSOSButton(BuildContext context) {
    return Semantics(
      label: 'Emergency SOS button. Press to send emergency alert to caregivers.',
      button: true,
      child: Container(
        width: 240,
        height: 240,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [Color(0xFFFF4757), Color(0xFFFF3742)],
            center: Alignment.center,
            radius: 0.8,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF4757).withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 5,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => _showEmergencyAlert(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: BrandColors.pureWhite,
            shape: const CircleBorder(),
            elevation: 0,
            padding: const EdgeInsets.all(24),
            minimumSize: const Size(240, 240),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emergency,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                'EMERGENCY',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                'SOS',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCards() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: BrandColors.pureWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: BrandColors.neutralGray.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Care Features',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: BrandColors.deepNavy,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureCard(
                'Medication\nReminder',
                Icons.medication,
                BrandColors.anchorGold,
              ),
              _buildFeatureCard(
                'Find\nCaregivers',
                Icons.people,
                BrandColors.mindBlue,
              ),
              _buildFeatureCard(
                'Location\nServices',
                Icons.location_on,
                BrandColors.brightCyan,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, Color color) {
    return Semantics(
      label: title.replaceAll('\n', ' '),
      button: true,
      child: Container(
        width: 100,
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: BrandColors.pureWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: BrandColors.neutralGray.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildQuickAction('Call Support', Icons.phone, BrandColors.mindBlue),
          _buildQuickAction('My Profile', Icons.person, BrandColors.anchorGold),
          _buildQuickAction('Settings', Icons.settings, BrandColors.neutralGray),
        ],
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon, Color color) {
    return Semantics(
      label: label,
      button: true,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: BrandColors.deepNavy,
            ),
          ),
        ],
      ),
    );
  }

  void _showEmergencyAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: BrandColors.pureWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4757).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.emergency,
                color: Color(0xFFFF4757),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Emergency Alert Sent!',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          'Your emergency alert has been sent to nearby caregivers. Help is on the way!\n\nStay calm and remain in your current location.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: BrandColors.neutralGray,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: BrandColors.mindBlue,
              foregroundColor: BrandColors.pureWhite,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'OK',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}