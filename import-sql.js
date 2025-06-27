const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();

(async () => {
  try {
    console.log("🚀 import-sql.js script has started");

    const connection = await mysql.createConnection({
      host: 'mysql.railway.internal',
      port: 3306,
      user: 'root',
      password: process.env.MYSQLPASSWORD,
      database: 'railway',
      multipleStatements: true  // ✅ Enable multiple statements!
    });

    const sql = fs.readFileSync('./setup.sql', 'utf8');

    console.log("📦 Running SQL from setup.sql...");

    // Use `.query()` only if `multipleStatements: true` is enabled
    await connection.query(sql);

    console.log("✅ SQL imported successfully!");
    await connection.end();
  } catch (err) {
    console.error("❌ Failed to import SQL:", err.message);
    process.exit(1);
  }
})();
