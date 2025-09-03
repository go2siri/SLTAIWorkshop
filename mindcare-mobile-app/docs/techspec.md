# MindCare Mobile App - Technical Specifications

## Project Overview

**MindCare** is a comprehensive mental health and wellness mobile application built with Flutter and Node.js backend. The platform provides users with access to mental health resources, mood tracking, location-based services for finding nearby therapists and support groups, push notifications for wellness reminders, and real-time communication capabilities for peer support.

## Architecture

### Overall Architecture
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   MindCare App  │────│   Backend API   │────│    Database     │
│  (Flutter UI)   │    │   (Node.js)     │    │   (MongoDB)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └─────────┬─────────────┼─────────────┬─────────┘
                   │             │             │
            ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
            │   Firebase  │ │ Google APIs │ │   Socket.IO │
            │  (FCM/Auth) │ │(Maps/Places)│ │ (Real-time) │
            └─────────────┘ └─────────────┘ └─────────────┘
```

### Flutter App Architecture (Clean Architecture)
```
lib/
├── core/                          # Core functionality
│   ├── config/
│   │   └── app_config.dart       # App configuration & themes
│   ├── network/
│   │   ├── api_client.dart       # HTTP client wrapper
│   │   └── dio_client.dart       # Dio configuration
│   ├── router/
│   │   └── app_router.dart       # Navigation routing
│   └── services/
│       └── dependency_injection.dart # Service locator
└── features/                      # Feature modules
    ├── auth/
    │   ├── data/
    │   │   ├── datasources/       # Remote/Local data sources
    │   │   └── repositories/      # Repository implementations
    │   ├── domain/
    │   │   ├── entities/          # Business objects
    │   │   ├── repositories/      # Repository interfaces
    │   │   └── usecases/          # Business logic
    │   └── presentation/
    │       ├── bloc/              # State management
    │       └── pages/             # UI components
    ├── location/                  # Location services for mental health resources
    ├── notifications/             # Push notifications & wellness reminders
    ├── wellness/                  # Mood tracking and wellness features
    └── support/                   # Support groups and peer communication
```

## Technology Stack

### Frontend (Flutter)

#### Core Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| flutter | >=3.16.0 | Mobile framework |
| dart | >=3.2.0 | Programming language |

#### Navigation & State Management
| Package | Version | Purpose |
|---------|---------|---------|
| go_router | ^13.2.0 | Declarative routing |
| flutter_bloc | ^8.1.4 | State management pattern |

#### HTTP & API Communication
| Package | Version | Purpose |
|---------|---------|---------|
| http | ^1.2.0 | Basic HTTP requests |
| dio | ^5.4.0 | Advanced HTTP client |
| retrofit | ^4.0.3 | Type-safe HTTP client |
| json_annotation | ^4.8.1 | JSON serialization |

#### Google APIs Integration
| Package | Version | Purpose |
|---------|---------|---------|
| google_maps_flutter | ^2.5.3 | Maps integration |
| geolocator | ^10.1.0 | Location services |
| geocoding | ^2.1.1 | Address/coordinate conversion |
| google_sign_in | ^6.2.1 | Google authentication |

#### Firebase Services
| Package | Version | Purpose |
|---------|---------|---------|
| firebase_core | ^2.24.2 | Firebase initialization |
| firebase_messaging | ^14.7.9 | Push notifications |
| firebase_analytics | ^10.7.4 | Analytics tracking |

#### Local Storage
| Package | Version | Purpose |
|---------|---------|---------|
| shared_preferences | ^2.2.2 | Key-value storage |
| sqflite | ^2.3.0 | Local database |
| path | ^1.8.3 | Path manipulation |

#### Utilities
| Package | Version | Purpose |
|---------|---------|---------|
| intl | ^0.19.0 | Internationalization |
| equatable | ^2.0.5 | Value equality |
| flutter_dotenv | ^5.1.0 | Environment variables |
| permission_handler | ^11.1.0 | System permissions |

### Backend (Node.js/Express)

#### Core Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| express | ^4.18.2 | Web framework |
| typescript | ^5.3.3 | Type safety |
| ts-node | ^10.9.2 | TypeScript execution |

#### Security & Middleware
| Package | Version | Purpose |
|---------|---------|---------|
| cors | ^2.8.5 | Cross-origin requests |
| helmet | ^7.1.0 | Security headers |
| morgan | ^1.10.0 | HTTP logging |
| compression | ^1.7.4 | Response compression |
| rate-limiter-flexible | ^4.0.1 | Rate limiting |

#### Authentication & Authorization
| Package | Version | Purpose |
|---------|---------|---------|
| jsonwebtoken | ^9.0.2 | JWT tokens |
| bcryptjs | ^2.4.3 | Password hashing |
| joi | ^17.11.0 | Input validation |

#### Database & External Services
| Package | Version | Purpose |
|---------|---------|---------|
| mongoose | ^8.0.3 | MongoDB ODM |
| firebase-admin | ^12.0.0 | Firebase Admin SDK |
| googleapis | ^131.0.0 | Google APIs client |

#### Real-time Communication
| Package | Version | Purpose |
|---------|---------|---------|
| socket.io | ^4.7.4 | WebSocket communication |

### Database

#### MongoDB
- **Version**: 7.0+
- **Purpose**: Primary data storage
- **Features**: Document-based NoSQL database
- **Connection**: Mongoose ODM for schema management

#### Redis (Optional)
- **Version**: 7.2+
- **Purpose**: Caching and session storage
- **Features**: In-memory data structure store

## API Specifications

### Authentication Endpoints
```
POST /api/auth/login
POST /api/auth/register  
POST /api/auth/google
POST /api/auth/refresh
DELETE /api/auth/logout
```

### Location Services Endpoints
```
GET /api/location/current
POST /api/location/geocode
POST /api/location/reverse
GET /api/location/places
GET /api/location/directions
GET /api/location/therapists          # Find nearby therapists
GET /api/location/support-groups      # Find support groups
GET /api/location/crisis-centers      # Find crisis intervention centers
```

### Notification & Wellness Endpoints
```
POST /api/notifications/send
POST /api/notifications/subscribe
DELETE /api/notifications/unsubscribe
GET /api/notifications/history
POST /api/notifications/wellness-reminder    # Schedule wellness check-ins
POST /api/notifications/mood-reminder        # Mood tracking reminders
```

### User Management Endpoints
```
GET /api/users/profile
PUT /api/users/profile
DELETE /api/users/account
GET /api/users/preferences
PUT /api/users/preferences
```

### Mental Health & Wellness Endpoints
```
GET /api/wellness/resources           # Get mental health resources
POST /api/wellness/mood-entry         # Log mood entry
GET /api/wellness/mood-history        # Get mood tracking history
GET /api/wellness/goals               # Get wellness goals
POST /api/wellness/goals              # Set wellness goals
GET /api/wellness/support-groups      # Find support groups
POST /api/wellness/crisis-support     # Access crisis support
GET /api/wellness/meditation          # Get guided meditation content
GET /api/wellness/coping-strategies   # Get coping strategies
```

## Google APIs Integration

### Required Google Cloud APIs
1. **Maps JavaScript API** - Interactive maps
2. **Geocoding API** - Address/coordinate conversion  
3. **Places API** - Location search and details
4. **Directions API** - Route planning
5. **Google Sign-In** - OAuth authentication

### API Key Configuration
```yaml
# Flutter (.env)
GOOGLE_MAPS_API_KEY=your_maps_api_key
GOOGLE_CLIENT_ID=your_oauth_client_id

# Backend (.env)  
GOOGLE_CLIENT_ID=your_oauth_client_id
GOOGLE_CLIENT_SECRET=your_oauth_client_secret
GOOGLE_MAPS_API_KEY=your_maps_api_key
```

## Firebase Configuration

### Services Used
- **Authentication**: Google sign-in provider
- **Cloud Messaging**: Push notifications
- **Analytics**: Usage tracking (optional)

### Configuration Files
- `google-services.json` (Android)
- `GoogleService-Info.plist` (iOS)
- Firebase Admin SDK service account key (Backend)

## Security Specifications

### Authentication Flow
1. User authenticates via Google OAuth
2. Backend validates Google token
3. Backend generates JWT access/refresh tokens
4. Client stores tokens securely
5. API requests include JWT in Authorization header

### Security Measures
- JWT token-based authentication
- Rate limiting (100 requests per 15 minutes)
- CORS configuration
- Input validation with Joi
- Password hashing with bcrypt
- Helmet security headers
- Environment-based secrets

### Permission Requirements

#### Android Permissions
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
<uses-permission android:name="android.permission.VIBRATE" />
```

#### iOS Permissions
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>MindCare needs location access to help you find nearby mental health resources, therapists, and support groups.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>MindCare needs location access to help you find nearby mental health resources, therapists, and support groups.</string>
```

## Performance Specifications

### Flutter App Performance
- **Target FPS**: 60 FPS on all supported devices
- **Memory Usage**: < 200MB peak usage
- **App Launch Time**: < 3 seconds cold start
- **Network Requests**: Retry logic with exponential backoff

### Backend Performance
- **Response Time**: < 500ms for standard API calls
- **Throughput**: 1000+ requests per second
- **Database Connections**: Connection pooling enabled
- **Memory Usage**: < 512MB under normal load

### Network Optimization
- Response compression enabled
- JSON payload optimization
- Image optimization for maps
- Efficient data pagination

## Development Environment

### Flutter Development
```bash
# Dependencies
flutter pub get

# Code generation
flutter packages pub run build_runner build

# Testing  
flutter test
flutter test --coverage

# Building
flutter build apk --release
flutter build ios --release
```

### Backend Development
```bash
# Dependencies
npm install

# Development
npm run dev      # nodemon with TypeScript

# Testing
npm test
npm run test:watch
npm run test:coverage

# Production
npm run build    # TypeScript compilation
npm start        # Production server
```

## Deployment Specifications

### Flutter App Deployment
- **Android**: Google Play Store (API level 21+)
- **iOS**: App Store (iOS 12.0+)
- **Build Tools**: GitHub Actions CI/CD

### Backend Deployment
- **Platform**: Docker containers
- **Environment**: Node.js 18+ runtime
- **Database**: MongoDB Atlas or self-hosted
- **Scaling**: Horizontal scaling with load balancer

### Infrastructure Requirements
- **Minimum Server**: 2 CPU cores, 4GB RAM
- **Database**: MongoDB cluster with replica set
- **CDN**: Static asset delivery
- **SSL**: HTTPS certificates required

## Testing Strategy

### Flutter Testing
- **Unit Tests**: Business logic and utilities
- **Widget Tests**: UI components
- **Integration Tests**: End-to-end user flows
- **Coverage Target**: >90% code coverage

### Backend Testing
- **Unit Tests**: Service layer and utilities
- **Integration Tests**: API endpoints
- **Load Tests**: Performance validation
- **Security Tests**: Authentication and authorization

### Testing Tools
- Flutter: `flutter_test`, `mockito`
- Backend: `jest`, `supertest`
- Load Testing: `artillery` or `k6`

## Monitoring & Analytics

### Application Monitoring
- Crash reporting with Firebase Crashlytics
- Performance monitoring with Firebase Performance
- Custom analytics events
- API response time monitoring

### Logging Strategy
- Structured logging with timestamps
- Error tracking and alerting  
- Performance metrics collection
- User activity analytics

## Version Management

### Versioning Strategy
- Semantic versioning (MAJOR.MINOR.PATCH)
- Git flow branching model
- Automated version bumping
- Release notes generation

### Compatibility Matrix
| Flutter Version | Backend Version | Min Android | Min iOS |
|----------------|-----------------|-------------|---------|
| 1.0.x          | 1.0.x           | API 21      | 12.0    |

## Documentation Requirements

### Code Documentation
- Inline code comments for complex logic
- API documentation with OpenAPI/Swagger
- Architecture decision records (ADRs)
- Setup and deployment guides

### User Documentation  
- Installation instructions
- API usage examples
- Troubleshooting guides
- Configuration references