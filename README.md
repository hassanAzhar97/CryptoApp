# CryptoApp
Crypto Tracker App
Overview
This is a test project for a Crypto Tracker App that allows users to track live cryptocurrency prices, view detailed information about coins, and manage a mock portfolio. The app integrates with the CoinGecko API to fetch real-time market data and uses RxSwift for reactive programming.

Features
1. Welcome Screen (Screen 01)
Displays an introduction screen with the app name and tagline.

Includes a "Get Started" button to navigate to the main screen.

2. Crypto List Screen (Market Overview and Portfolio) (Screen 02)
Displays live cryptocurrency prices fetched from the CoinGecko API, including:

Coin name, symbol, price, and 24-hour percentage change.

Market cap and volume.

Shows a mock portfolio with:

Total balance and monthly performance chart.

Portfolio allocation by coin (mock data).

Implements RxSwift for real-time market updates.

Includes pull-to-refresh functionality to refresh data.

3. Search Functionality (Optional)
Implements a search bar to filter cryptocurrencies by name.

Uses RxSwift’s debounce operator to optimize API calls.

4. Coin Details Screen (Screen 03)
Displays detailed information for each cryptocurrency using the CoinGecko API, including:

Coin name, price, market cap, and volume.

Seven-day price chart using historical data from the API.

Favorite button to save coins locally (mock implementation).

API Integration
The app integrates with the CoinGecko API to fetch:

Live cryptocurrency prices.

Historical data for price charts.

Coin details (name, symbol, market cap, volume, etc.).

Note: If certain fields are not available in the API, mock data is used as a fallback.

Technologies Used
RxSwift: For reactive programming and real-time updates.

Alamofire: For API requests and handling network calls.

SwiftUI: For building the user interface (if applicable).

Combine: For managing state and data flow (if applicable).

CoinGecko API: For fetching cryptocurrency data.

Setup Instructions
Prerequisites
Xcode installed (version 16 or later).
Swift Package Manager for dependency management.

If using Swift Package Manager, add the required dependencies in Xcode.

Open the Project:
Open the .xcworkspace file in Xcode.

Run the App:
Select a simulator or device and click the Run button in Xcode.

Project Structure
Copy
CryptoTrackerApp/
├── Models/               # Data models for API responses
├── Views/                # SwiftUI views for each screen
├── ViewModels/           # ViewModels for managing state and logic
├── Services/             # API service classes
├── Utilities/            # Helper functions and constants
├── Assets.xcassets/      # App assets (images, icons, etc.)
└── Info.plist            # App configuration file
Mock Data
Portfolio Data: Mock data is used to display the portfolio balance, monthly performance chart, and allocation by coin.

Favorite Coins: Locally saved mock data is used to manage favorite coins.

Future Improvements
Implement user authentication and a backend to store portfolio and favorite coins.

Add more advanced charting features using a library like Charts.

Integrate push notifications for price alerts.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
CoinGecko API for providing cryptocurrency data.

RxSwift for reactive programming support.

Contact
For any questions or feedback, feel free to reach out.

Thank you for checking out the Crypto Tracker App! 🚀
