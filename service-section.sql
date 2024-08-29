CREATE TABLE "Admin" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "email" varchar(100),
  "password" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Device" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "model" varchar(100),
  "serial_number" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "System" (
  "id" serial PRIMARY KEY,
  "device_id" int,
  "name" varchar(100),
  "description" text,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Sensor" (
  "id" serial PRIMARY KEY,
  "system_id" int,
  "name" varchar(100),
  "type" varchar(50),
  "unit" varchar(20),
  "location" varchar(100),
  "description" text,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "SensorData" (
  "id" serial PRIMARY KEY,
  "sensor_id" int,
  "recorded_at" timestamp,
  "value" float,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE INDEX ON "SensorData" ("sensor_id", "recorded_at");

ALTER TABLE "System" ADD FOREIGN KEY ("device_id") REFERENCES "Device" ("id");

ALTER TABLE "Sensor" ADD FOREIGN KEY ("system_id") REFERENCES "System" ("id");

ALTER TABLE "SensorData" ADD FOREIGN KEY ("sensor_id") REFERENCES "Sensor" ("id");
