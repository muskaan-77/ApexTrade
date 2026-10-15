# 🚀 ApexTrade — Online Stock Trading Platform

A full-stack, enterprise-grade **Online Stock Trading Platform** developed in **Java** (JDK 17/21/26 standard library, zero external Maven/Gradle or third-party runtime dependencies required).

The platform allows traders to execute buy/sell orders, track investment portfolios, and monitor real-time market updates, while giving administrators full oversight of user management, financial data security, system settings, trade activity monitoring, and report generation.

---

## 📋 Table of Contents
- [Project Architecture](#-project-architecture)
- [Key Features & Specification Checklist](#-key-features--specification-checklist)
- [User Types & Dashboards](#-user-types--dashboards)
  - [1. Trader Portal](#1-trader-portal)
  - [2. Admin Console](#2-admin-console)
- [REST API Reference](#-rest-api-reference)
- [File & Directory Structure](#-file--directory-structure)
- [Quick Start & Execution](#-quick-start--execution)

---

## 🏛 Project Architecture

```
┌────────────────────────────────────────────────────────────────────────┐
│                        ApexTrade Web Client                            │
│  (Modern Financial Terminal UI: Tailwind CSS, Chart.js, Lucide Icons)  │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │ HTTP / REST & Static Assets
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│                StockHttpServer (JDK Built-in Server)                   │
│   • Multi-threaded Worker Pool      • Static Asset Pipeline            │
│   • REST Router & JSON Dispatcher   • CORS & Error Handling            │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
    ┌───────────────────────────────┴──────────────────────────────┐
    ▼                                                              ▼
┌───────────────────────────┐                    ┌───────────────────────────────┐
│     Trading Engine        │                    │    Administration Engine      │
│ • Market / Limit Orders   │                    │ • User CRUD & Role Governance │
│ • Fee Calculation (0.15%) │                    │ • Financial Security Policies │
│ • Portfolio Mark-to-Market│                    │ • System Configurations       │
│ • Price Alert Sentinel    │                    │ • Trade Activity Telemetry    │
│ • Live Price Simulation   │                    │ • Financial & Audit Reports   │
└───────────────────────────┘                    └───────────────────────────────┘
```

---

## ✅ Key Features & Specification Checklist

| Requirement | Implementation Details |
|---|---|
| **Language & Runtime** | Built using **Java** (JDK 26 Standard Edition), multi-threaded HTTP server, zero Maven/npm external dependency bloat. |
| **Trader: Stock Trading** | Buy and sell equities (Market & Limit orders), live ticker price calculations, commission fee deduction, instant confirmation modal & toast. |
| **Trader: Portfolio Tracking** | Live mark-to-market position valuations, unrealized P&L calculations ($ and %), cash reserves, and interactive Asset Allocation Donut chart. |
| **Trader: Market Updates** | Categorized news wire (Technology, Macro, Financials), automated sentiment indicators (Bullish, Bearish, Neutral), and dynamic stock tickers. |
| **Trader: Trade History** | Filterable log of past executions (Date, Symbol, Type, Quantity, Price, Turnover, Status) with one-click CSV export. |
| **Trader: Alerts & Notifications** | Price alert threshold manager (Above/Below trigger alerts) with instantaneous trigger notifications. |
| **Admin: User Management** | Full CRUD capabilities for user accounts (Add, Edit, Delete), role toggling (Admin / Trader), cash balance management. |
| **Admin: Financial Data Security** | Encryption cipher policies (AES-256-GCM), Multi-Factor Authentication (MFA) enforcement, session timeout controls, compliance audit scan, and recent security incidents log. |
| **Admin: System Settings** | Trading fee percentage customization, Market Open/Close switch, Maintenance Mode emergency freeze, max order limits, and JVM runtime telemetry (uptime, memory, threads). |
| **Admin: Trade Activity Monitoring** | Visual graphs: Turnover Distribution Bar Chart, Order Side Ratio (Buy vs Sell), and Global live order stream across all traders. |
| **Admin: Report Generation** | Financial turnover reports, user portfolio asset allocation audits, infrastructure telemetry reports, with direct CSV and printable export. |

---

## 👥 User Types & Dashboards

### 1. Trader Portal
- **Default Trader Profile**: `Alex Morgan` (`alex.trader@apex.com`)
- **Initial Cash Balance**: `$48,250.00`
- **Pre-loaded Holdings**: AAPL (60 shares), NVDA (120 shares), MSFT (25 shares), TSLA (30 shares)
- **Tabs**:
  1. **Stock Trading**: Live Watchlist, interactive price chart with timeframe selector, instant order execution pad with dynamic fee and total estimation.
  2. **Portfolio Overview**: Visual summary of net worth, cash balance, equity positions, unrealized gain/loss, and asset allocation breakdown.
  3. **Market Updates**: Real-time financial headlines categorized with bullish/bearish market sentiment.
  4. **Trade History**: Searchable ledger of all historical buy/sell orders.
  5. **Alerts & Notifications**: Automated sentinel price trigger alerts with notification bell drawer.

### 2. Admin Console
- **Default Administrator Profile**: `Eleanor Vance` (`admin@apex.com`)
- **Tabs**:
  1. **User Management**: Add new accounts, modify roles and statuses (Active / Suspended), update cash liquidity, or delete users.
  2. **Financial Data Security**: Manage encryption standards, MFA policies, IP whitelisting, review threat incident logs, and run automated security compliance scans.
  3. **System Settings**: Set exchange fee percentage, open/close trading sessions, trigger maintenance mode, and inspect live JVM telemetry.
  4. **Trade Activity Monitoring**: Graphical representations of turnover by equity, buy-to-sell ratios, and global exchange trades stream.
  5. **Report Generation**: Generate comprehensive financial audits, portfolio allocations, and system performance reports with CSV export.

---

## 🔌 REST API Reference

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/stocks` | List all equities with live quotes and price history |
| `POST` | `/api/trade` | Execute a Buy or Sell stock order |
| `GET` | `/api/portfolio?userId={id}` | Retrieve trader portfolio, holdings, and P&L metrics |
| `GET` | `/api/trades?userId={id}` | Retrieve past trades (optional filter by user) |
| `GET` | `/api/users` | List all registered user accounts |
| `POST` | `/api/users` | Create a new user account |
| `PUT` | `/api/users` | Update an existing user account |
| `DELETE` | `/api/users?id={id}` | Delete a user account |
| `GET` | `/api/security` | Get financial security settings and incident logs |
| `POST` | `/api/security` | Update cryptographic and authentication security policies |
| `POST` | `/api/security/scan` | Trigger automated compliance and vulnerability audit |
| `GET` | `/api/system` | Get system configurations and runtime metrics |
| `POST` | `/api/system` | Update exchange settings (fees, market status, limits) |
| `GET` | `/api/analytics` | Get trade turnover statistics and activity metrics |
| `GET` | `/api/reports?type={type}` | Generate financial or analytics report |
| `GET` | `/api/reports/export?type={type}` | Export report as a CSV file |
| `GET` | `/api/alerts?userId={id}` | Get user price trigger alerts |
| `POST` | `/api/alerts` | Create a new stock price alert |
| `DELETE` | `/api/alerts?id={id}` | Remove a price alert |
| `GET` | `/api/notifications?userId={id}` | Get notifications feed |
| `GET` | `/api/news?category={cat}` | Get real-time categorized market news |

---

## 📁 File & Directory Structure

```
Trading Project/
├── bin/                              # Compiled Java class binaries
│   └── com/stocktrading/
├── src/                              # Java Source Code
│   └── com/stocktrading/
│       ├── Main.java                 # Server startup & port binding entry point
│       ├── model/                    # Data models
│       │   ├── User.java             # Admin & Trader user entity
│       │   ├── Stock.java            # Equities with price fluctuations
│       │   ├── Trade.java            # Executed order records
│       │   ├── PortfolioItem.java    # Trader stock holding & P&L
│       │   ├── SecuritySettings.java # Financial security & incidents
│       │   ├── SystemSettings.java   # Platform configuration & metrics
│       │   ├── MarketNews.java       # Market news item with sentiment
│       │   ├── Alert.java            # Trader price trigger alerts
│       │   └── Notification.java     # User notification messages
│       ├── service/                  # Business logic services
│       │   ├── TradingPlatformState.java # Thread-safe singleton memory state
│       │   ├── MarketDataService.java    # Real-time price simulation engine
│       │   ├── TradingService.java       # Buy/Sell matching & fee engine
│       │   ├── UserService.java          # Admin User CRUD operations
│       │   ├── SecurityService.java      # Financial data security service
│       │   ├── SystemSettingsService.java# System configuration & telemetry
│       │   ├── ReportService.java        # Financial report & CSV generator
│       │   └── AlertService.java         # Alert triggers & notifications
│       ├── util/
│       │   └── JsonUtil.java         # Native zero-dependency JSON parser/serializer
│       └── server/
│           └── StockHttpServer.java  # HTTP server & REST endpoint router
├── web/                              # Frontend Web Assets
│   ├── index.html                    # Trading terminal & Admin console Single Page App
│   ├── css/
│   │   └── style.css                 # Terminal dark theme styling & animations
│   └── js/
│       └── app.js                    # Reactive client-side application logic & charts
├── compile.bat                       # Compilation script
├── run.bat                           # One-click compile, run server & open browser
└── README.md                         # Documentation
```

---

## ⚡ Quick Start & Execution

### Option 1: One-Click Execution (Windows)
Double-click **`run.bat`** or run from PowerShell:
```cmd
.\run.bat
```
This will automatically:
1. Compile all Java sources to the `bin/` directory.
2. Start the `ApexTrade` backend server on port `8080`.
3. Open your default web browser directly to `http://localhost:8080`.

### Option 2: Command Line (Manual)
```powershell
# 1. Compile Java files
javac -encoding UTF-8 -d bin (Get-ChildItem -Path "src" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName })

# 2. Run the application
java -cp bin com.stocktrading.Main 8080
```
Open **`http://localhost:8080`** in any web browser.

---
*© 2024 ApexTrade Global. Developed for GUVI Online Stock Trading Platform specification.*
