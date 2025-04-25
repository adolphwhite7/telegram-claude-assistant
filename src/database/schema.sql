-- Initial database schema for Gift Card Assistant

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY,
    username TEXT,
    first_name TEXT,
    last_name TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Conversations table
CREATE TABLE IF NOT EXISTS conversations (
    conversation_id TEXT PRIMARY KEY,
    user_id INTEGER,
    title TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Messages table
CREATE TABLE IF NOT EXISTS messages (
    message_id TEXT PRIMARY KEY,
    conversation_id TEXT,
    role TEXT,
    content TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id)
);

-- Gift cards table
CREATE TABLE IF NOT EXISTS gift_cards (
    card_id INTEGER PRIMARY KEY AUTOINCREMENT,
    number TEXT,
    pin TEXT,
    original_balance REAL,
    updated_balance REAL,
    supplier_source TEXT,
    status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crypto payments table
CREATE TABLE IF NOT EXISTS crypto_payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    transaction_id TEXT,
    transaction_hash TEXT,
    cryptocurrency_type TEXT,
    amount REAL,
    usd_value REAL,
    recipient_address TEXT,
    deposit_address TEXT,
    blockchain_network TEXT,
    network_fee REAL,
    price_at_transaction REAL,
    transaction_time TIMESTAMP,
    transaction_status TEXT,
    direction TEXT,
    related_gift_card_id INTEGER,
    related_supplier_id INTEGER,
    notes TEXT,
    FOREIGN KEY (related_gift_card_id) REFERENCES gift_cards(card_id),
    FOREIGN KEY (related_supplier_id) REFERENCES suppliers(supplier_id)
);

-- Suppliers table
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    contact_info TEXT,
    payment_method TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    gift_card_id INTEGER,
    transaction_type TEXT,
    amount REAL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (gift_card_id) REFERENCES gift_cards(card_id)
);
