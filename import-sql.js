const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();

(async () => {
  try {
    console.log("⏳ Connecting to DB...");

    const connection = await mysql.createConnection({
      host: 'mysql.railway.internal',                // ✅ internal Railway DB host
      port: 3306,                                     // ✅ default MySQL port
      user: 'root',                                   // ✅ Railway user
      password: 'xGFAFTpBnBEvAHRGwoBQmaXyCuGBIpUk',   // ✅ your Railway password
      database: 'railway'                             // ✅ your DB name
    });

    const sql = fs.readFileSync('./setup.sql', 'utf-8');
    console.log("📦 Running SQL from setup.sql...");
    await connection.query(sql);

    console.log("✅ SQL imported successfully!");
    await connection.end();
  } catch (err) {
    console.error("❌ Failed to import SQL:", err.message);
    process.exit(1);
  }
})();
