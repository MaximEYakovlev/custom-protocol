CREATE TABLE "Admin" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "username" varchar(100),
  "password" varchar(255),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "DoctorIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "password" varchar(255),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "PatientIndex" (
  "id" serial PRIMARY KEY,
  "skinType_id" int,
  "firstname" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "sex" varchar(10),
  "comment" varchar(250),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "SkinTypeIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "ProcedureIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Treatment" (
  "id" serial PRIMARY KEY,
  "procedureIndex_id" int,
  "doctorIndex_id" int,
  "patientIndex_id" int,
  "date" date,
  "total_shots" int,
  "total_energy" decimal,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "DoctorIndexPatientIndex" (
  "doctor_id" int,
  "patient_id" int,
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

CREATE TABLE "ExecutionUnit" (
  "id" serial PRIMARY KEY,
  "volume" int,
  "adjustment_coefficients" decimal
);

CREATE INDEX ON "SensorData" ("sensor_id", "recorded_at");

ALTER TABLE "PatientIndex" ADD FOREIGN KEY ("skinType_id") REFERENCES "SkinTypeIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("procedureIndex_id") REFERENCES "ProcedureIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("doctorIndex_id") REFERENCES "DoctorIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("patientIndex_id") REFERENCES "PatientIndex" ("id");

ALTER TABLE "DoctorIndexPatientIndex" ADD FOREIGN KEY ("doctor_id") REFERENCES "DoctorIndex" ("id");

ALTER TABLE "DoctorIndexPatientIndex" ADD FOREIGN KEY ("patient_id") REFERENCES "PatientIndex" ("id");

ALTER TABLE "System" ADD FOREIGN KEY ("device_id") REFERENCES "Device" ("id");

ALTER TABLE "Sensor" ADD FOREIGN KEY ("system_id") REFERENCES "System" ("id");

ALTER TABLE "SensorData" ADD FOREIGN KEY ("sensor_id") REFERENCES "Sensor" ("id");
