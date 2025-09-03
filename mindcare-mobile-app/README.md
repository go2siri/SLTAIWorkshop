# MindCare Mobile App

A comprehensive Flutter mobile application for mental health and wellness with Node.js backend integration, featuring Google APIs support for location services, push notifications, and real-time support features.

## Project Structure

```
mindcare-mobile-app/
├── flutter_app/          # Flutter mobile application (MindCare)
│   ├── lib/
│   │   ├── core/          # Core functionality
│   │   │   ├── config/    # App configuration
│   │   │   ├── network/   # API clients
│   │   │   ├── router/    # Navigation routing
│   │   │   └── services/  # Dependency injection
│   │   └── features/      # Feature modules
│   │       ├── auth/      # Authentication
│   │       ├── location/  # Location services
│   │       └── notifications/ # Push notifications
│   ├── android/           # Android-specific files
│   ├── ios/              # iOS-specific files
│   └── pubspec.yaml      # Dependencies
└── backend/              # Node.js/Express API (MindCare Backend)
    ├── src/
    │   ├── config/       # Database & Firebase config
    │   ├── controllers/  # API controllers
    │   ├── middleware/   # Express middleware
    │   ├── models/       # Data models
    │   ├── routes/       # API routes
    │   └── services/     # Business logic
    └── package.json      # Dependencies
```

## Features

### MindCare Flutter App
- **Clean Architecture**: Feature-based structure with separation of concerns
- **State Management**: Flutter BLoC pattern for reactive programming
- **Navigation**: Go Router for declarative routing
- **Mental Health Features**: Mood tracking, wellness resources, support groups
- **Location Services**: Find nearby mental health resources and support centers
- **Push Notifications**: Firebase Cloud Messaging for reminders and support
- **Google APIs**: Maps, Places, Directions integration for resource discovery
- **Authentication**: Secure Google Sign-in and user management

### MindCare Backend API
- **RESTful API**: Express.js with TypeScript for robust backend services
- **Real-time Communication**: Socket.IO for live chat and support features
- **Authentication**: JWT-based auth with Google OAuth for secure access
- **Database**: MongoDB with Mongoose ODM for user and wellness data
- **Firebase Integration**: Admin SDK for push notifications and analytics
- **Google Services**: Maps, Geocoding, Places APIs for resource location
- **Security**: Comprehensive security with Helmet, CORS, and rate limiting
- **Mental Health Data**: Secure handling of sensitive wellness information

## Setup Instructions

### Prerequisites
- Flutter SDK (>=3.16.0)
- Node.js (>=18.0.0)
- MongoDB
- Firebase project
- Google Cloud Platform account

### Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Configure environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. Start development server:
   ```bash
   npm run dev
   ```

### Flutter App Setup

1. Navigate to Flutter app directory:
   ```bash
   cd flutter_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. Configure Google Maps API key:
   - Android: Edit `android/app/src/main/res/values/strings.xml`
   - iOS: Add key to `ios/Runner/Info.plist`

5. Run the app:
   ```bash
   flutter run
   ```

## Google APIs Configuration

### Required APIs
1. **Maps JavaScript API**
2. **Geocoding API**
3. **Places API**
4. **Directions API**

### Setup Steps
1. Create a Google Cloud Platform project
2. Enable the required APIs
3. Create API credentials
4. Configure OAuth 2.0 for Google Sign-in
5. Add API keys to environment files

## Firebase Configuration

1. Create a Firebase project
2. Enable Authentication (Google provider)
3. Enable Cloud Messaging
4. Download configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS
5. Generate service account key for backend

## Development Commands

### Backend
```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm test             # Run tests
npm run lint         # Run ESLint
```

### Flutter
```bash
flutter run          # Run in debug mode
flutter build apk    # Build Android APK
flutter build ios    # Build iOS app
flutter test         # Run tests
flutter analyze      # Static analysis
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/google` - Google OAuth login
- `POST /api/auth/refresh` - Refresh token

### Location Services
- `GET /api/location/current` - Get current location
- `POST /api/location/geocode` - Geocode address
- `POST /api/location/reverse` - Reverse geocode
- `GET /api/location/places` - Search nearby mental health resources
- `GET /api/location/therapists` - Find nearby therapists and counselors
- `GET /api/location/support-groups` - Locate support groups

### Notifications & Reminders
- `POST /api/notifications/send` - Send notification
- `POST /api/notifications/subscribe` - Subscribe to wellness reminders
- `DELETE /api/notifications/unsubscribe` - Unsubscribe from topic
- `POST /api/notifications/wellness-reminder` - Schedule wellness check-ins

### Mental Health Features
- `GET /api/wellness/resources` - Get wellness resources
- `POST /api/wellness/mood-entry` - Log mood entry
- `GET /api/wellness/mood-history` - Get mood tracking history
- `GET /api/wellness/support-groups` - Find support groups
- `POST /api/wellness/crisis-support` - Access crisis support resources

## Architecture Patterns

### Flutter (Clean Architecture)
- **Presentation Layer**: UI components and BLoC state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories and data sources

### Backend (Layered Architecture)
- **Routes**: API endpoints and request handling
- **Controllers**: Business logic coordination
- **Services**: Core business logic
- **Models**: Data structures and database schemas

## Security Features

- JWT authentication with refresh tokens
- Rate limiting and request throttling
- CORS configuration
- Input validation and sanitization
- Security headers with Helmet
- Environment-based configuration

## Testing

### Flutter Testing
```bash
flutter test                    # Unit and widget tests
flutter integration_test        # Integration tests
```

### Backend Testing
```bash
npm test                       # Unit tests
npm run test:watch            # Watch mode
npm run test:coverage         # Coverage report
```

## Deployment

### Flutter App
- **Android**: Build APK/AAB and deploy to Google Play Store
- **iOS**: Build IPA and deploy to App Store

### Backend API
- Deploy to cloud platforms (AWS, Google Cloud, Heroku)
- Configure environment variables
- Set up MongoDB Atlas for database
- Configure Firebase for production

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new features
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.