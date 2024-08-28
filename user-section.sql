CREATE TABLE "Admin" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "email" varchar(100),
  "password" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Doctor" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Patient" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "sex" varchar(10),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "SkinType" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Treatment" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Procedure" (
  "id" serial PRIMARY KEY,
  "doctor_id" int,
  "patient_id" int,
  "treatment_id" int,
  "procedure_date" date,
  "total_shots" int,
  "total_energy" int,
  "spot_size" float,
  "fluence_ay" float,
  "patient_cooling_temp" float,
  "patient_cooling_flow" float,
  "shot_count" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "DoctorTreatment" (
  "doctor_id" int,
  "treatment_id" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "PatientTreatment" (
  "patient_id" int,
  "treatment_id" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "PatientSkinType" (
  "patient_id" int,
  "skinType_id" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE UNIQUE INDEX ON "Procedure" ("doctor_id", "patient_id", "treatment_id", "procedure_date");

CREATE UNIQUE INDEX ON "DoctorTreatment" ("doctor_id", "treatment_id");

CREATE UNIQUE INDEX ON "PatientTreatment" ("patient_id", "treatment_id");

CREATE UNIQUE INDEX ON "PatientSkinType" ("patient_id", "skinType_id");

ALTER TABLE "Procedure" ADD FOREIGN KEY ("doctor_id") REFERENCES "Doctor" ("id");

ALTER TABLE "Procedure" ADD FOREIGN KEY ("patient_id") REFERENCES "Patient" ("id");

ALTER TABLE "Procedure" ADD FOREIGN KEY ("treatment_id") REFERENCES "Treatment" ("id");

ALTER TABLE "DoctorTreatment" ADD FOREIGN KEY ("doctor_id") REFERENCES "Doctor" ("id");

ALTER TABLE "DoctorTreatment" ADD FOREIGN KEY ("treatment_id") REFERENCES "Treatment" ("id");

ALTER TABLE "PatientTreatment" ADD FOREIGN KEY ("patient_id") REFERENCES "Patient" ("id");

ALTER TABLE "PatientTreatment" ADD FOREIGN KEY ("treatment_id") REFERENCES "Treatment" ("id");

ALTER TABLE "PatientSkinType" ADD FOREIGN KEY ("patient_id") REFERENCES "Patient" ("id");

ALTER TABLE "PatientSkinType" ADD FOREIGN KEY ("skinType_id") REFERENCES "SkinType" ("id");
