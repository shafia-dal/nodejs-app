import { config } from "dotenv";
config();

export const database = {
  connectionLimit: 10,
  host: process.env.DATABASE_HOST || "rds.cmwy9eiqvst3.us-east-1.rds.amazonaws.com",
  user: process.env.DATABASE_USER || "rds",
  password: process.env.DATABASE_PASSWORD || "password123",
  database: process.env.DATABASE_NAME || "linksdb",
  port: process.env.DATABASE_PORT || 3306,
};

export const port = process.env.PORT || 4000;

export const SECRET = process.env.SECRET || 'some secret key';